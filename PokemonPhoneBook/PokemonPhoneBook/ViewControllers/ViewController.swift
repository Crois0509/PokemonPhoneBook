//
//  ViewController.swift
//  PokemonPhoneBook
//
//  Created by 장상경 on 12/6/24.
//

import UIKit
import SnapKit

// Main ViewController
final class ViewController: UIViewController, PhoneBookDataDelegate {
    
    // MARK: - ViewController Property
    
    // 뷰의 현재 상태
    private var editingMode: Bool = false
    
    // 테이블 뷰 데이터 소스
    private var dataSource: [PhoneBookData] = []
    // 삭제를 위해 선택한 셀
    private var selectedItem: Set<PhoneBookData> = []
        
    // MARK: - ViewController UI
    private let tableView = UITableView()
    private let navigationTitle = UILabel()
    private let pushButton = UIButton()
    private let editingButton = UIButton()
    private let myProfileView = MyProfileView()
    
    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI() // UI 세팅
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        
        // 코어 데이터에서 데이터 알파벳 내림차순으로 불러오기
        updateTableViewData()
                        
        self.tableView.reloadData() // 테이블뷰 reload
        self.navigationController?.navigationBar.isHidden = true // 뷰가 생성될 때마다 네비게이션 바 Hedden
    }
}

// MARK: - ViewController UI Setting Method
private extension ViewController {
    
    /// 뷰의 모든 UI를 세팅하는 메소드
    func configUI() {
        view.backgroundColor = .systemBackground
        [self.navigationTitle,
         self.editingButton,
         self.pushButton,
         self.myProfileView,
         self.tableView
        ].forEach { view.addSubview($0) }
        
        setupTableView()
        setupMyProfileView()
        setupNavigationTitle()
        setupPushButtonView()
        setupEditingButton()
        setupUILayout()
    }
    
    /// 네비게이션 타이블 UI를 세팅하는 메소드
    func setupNavigationTitle() {
        self.navigationItem.title = "친구 목록"
        self.navigationTitle.text = "친구 목록"
        self.navigationTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.navigationTitle.textAlignment = .center
        self.navigationTitle.textColor = .label
        self.navigationTitle.backgroundColor = .clear
    }
    
    /// 에디팅 버튼의 UI를 세팅하는 메소드
    func setupEditingButton() {
        var config = UIButton.Configuration.plain()
        
        var titleAttr = !self.editingMode ? AttributedString("편집") : AttributedString("취소")
        titleAttr.font = .systemFont(ofSize: 20, weight: .medium)
        
        config.attributedTitle = titleAttr
        config.baseForegroundColor = !self.editingMode ? .systemBlue : .systemGray
        
        self.editingButton.configuration = config
        self.editingButton.backgroundColor = .clear
        self.editingButton.addTarget(self, action: #selector(editingTableView), for: .touchUpInside)
    }
    
    /// 푸쉬 버튼의 UI를 세팅하는 메소드
    func setupPushButtonView() {
        var config = UIButton.Configuration.plain()
        
        let deleteButtonLabel = self.selectedItem.isEmpty ? "모두 지우기" : "(\(self.selectedItem.count) 개) 지우기"
        
        var titleAttr = !self.editingMode ? AttributedString("추가") : AttributedString(deleteButtonLabel)
        titleAttr.font = .systemFont(ofSize: 20, weight: .medium)
        
        config.attributedTitle = titleAttr
        config.baseForegroundColor = !self.editingMode ? .systemBlue : .systemRed
        
        self.pushButton.configuration = config
        self.pushButton.backgroundColor = .clear
        
        self.pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
    }
    
    /// 프로필 뷰의 UI를 세팅하는 메소드
    func setupMyProfileView() {
        self.myProfileView.backgroundColor = .lightGray.withAlphaComponent(0.1)
        
        let touchEvent = UITapGestureRecognizer(target: self, action: #selector(showMyProfile)) // 터치 이벤트
        self.myProfileView.addGestureRecognizer(touchEvent)
    }
    
    /// 테이블 뷰의 UI를 세팅하는 메소드
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(PhoneBookCell.self, forCellReuseIdentifier: PhoneBookCell.id)
        self.tableView.backgroundColor = .clear
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.separatorInset.right = 20
        self.tableView.sectionHeaderTopPadding = 0
    }
    
    /// 뷰의 모든 레이아웃을 세팅하는 메소드
    func setupUILayout() {
        self.navigationTitle.snp.makeConstraints {
            $0.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.height.equalTo(60)
        }
        
        self.myProfileView.snp.makeConstraints {
            $0.top.equalTo(self.navigationTitle.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(105)
        }
        
        self.tableView.snp.makeConstraints {
            $0.trailing.leading.bottom.equalTo(view)
            $0.top.equalTo(self.myProfileView.snp.bottom)
        }
        
        self.pushButton.snp.makeConstraints {
            $0.top.bottom.equalTo(self.navigationTitle)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        self.editingButton.snp.makeConstraints {
            $0.top.bottom.equalTo(self.navigationTitle)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}

// MARK: - ViewController Objective-C Method
@objc private extension ViewController {
    /// 푸쉬 버튼의 액션 메소드
    /// 푸쉬 버튼을 누르면 PhoneBookViewController 뷰가 쌓임
    func pushButtonAction() {
        if !self.editingMode {
            self.navigationController?.pushViewController(PhoneBookViewController(), animated: true)
            self.navigationController?.navigationBar.isHidden = false // 뷰가 쌓이면 네이게이션바를 보여줌
        } else {
            deleteTableViewCell()
        }
    }
    
    /// 현재 뷰의 모드를 바꾸는 메소드
    func editingTableView() {
        self.editingMode.toggle()
        refreshUI()
        view.layoutIfNeeded()
    }
    
    /// 프로필 뷰를 터치했을 때 발생하는 액션
    ///
    /// 모달뷰로 프로필뷰를 보여주고 수정할 수 있게 해줌
    func showMyProfile() {
        guard let name = UserDefaults.standard.string(forKey: "myName"),
              let number = UserDefaults.standard.string(forKey: "myNumber"),
              let imageData = UserDefaults.standard.data(forKey: "myProfile"),
              let image = UIImage(data: imageData) else { return }
        
        let phoneNumber = number.split(separator: "-").joined()
        
        let modalProfileView = PhoneBookViewController()
        modalProfileView.state = .profile
        modalProfileView.editPhoneNumber(name: name, number: phoneNumber, image: image)
        modalProfileView.additionalSafeAreaInsets.top = 30
        modalProfileView.sheetPresentationController?.preferredCornerRadius = 50

        // 모달뷰가 deinit 되는 경우 프로필 뷰 새로고침
        modalProfileView.deinitCompletion = { [weak self] in
            guard let self else { return }
            self.myProfileView.reloadData()
        }
        
        modalProfileView.modalPresentationStyle = .formSheet
        self.present(modalProfileView, animated: true)
    }
}

// MARK: - ViewController Private Method
private extension ViewController {
    /// 테이블뷰의 데이터소스를 업데이트 하는 메소드
    func updateTableViewData() {
        self.dataSource = readAllData().sorted(by: {
            if let lhs = $0.name, let rhs = $1.name {
                return lhs < rhs
            } else {
                return false
            }
        })
    }
    
    /// 버튼의 UI를 새로고침하는 메소드
    func refreshUI() {
        setupPushButtonView()
        setupEditingButton()
        self.tableView.reloadData()
    }
    
    /// 선택된 테이블뷰 셀을 삭제하는 메소드
    ///
    /// 선택된 셀이 없을 경우 전체 삭제
    func deleteTableViewCell() {
        if !self.selectedItem.isEmpty  {
            ValidationAlert.confirmDeleteDataAlert(on: self) { [weak self] in
                guard let self else { return }
                self.selectedItem.forEach {
                    guard let name = $0.name, let number = $0.number else { return }
                    self.deleteData(name: name, number: number)
                }
                self.updateTableViewData()
                self.selectedItem.removeAll()
                self.refreshUI()
                self.view.layoutIfNeeded()
            }
        } else {
            guard !self.dataSource.isEmpty else {
                ValidationAlert.showValidationAlert(on: self, title: "경고", message: "삭제할 데이터가 없습니다!!", completion: nil)
                return
            }
            ValidationAlert.confirmDeleteDataAlert(on: self) { [weak self] in
                guard let self else { return }
                self.deleteAllData()
                self.updateTableViewData()
                self.selectedItem.removeAll()
                self.refreshUI()
                self.view.layoutIfNeeded()
            }
        }
    }
}

// MARK: - ViewController TableView DataSource Method
extension ViewController: UITableViewDataSource {
    
    // 테이블뷰의 셀 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    // 테이블뷰 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: PhoneBookCell.id) as? PhoneBookCell else {
            return UITableViewCell()
        }
        
        // 현재 뷰가 editingMode가 아니라면
        if !self.editingMode {
            cell.updataCellUI(self.dataSource[indexPath.row])
            
        // 현재 뷰가 editingMode 라면
        } else {
            let isSelected = self.selectedItem.contains(self.dataSource[indexPath.row])
            cell.editingCell(self.dataSource[indexPath.row], isSelected: isSelected)
        }
                
        return cell
    }
    
    // 테이블뷰 셀 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // 테이블뷰 헤더 크기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    // 테이블뷰 헤더 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let friendLabel = UILabel()
        
        friendLabel.text = "친구 프로필"
        friendLabel.textColor = .label
        friendLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        friendLabel.textAlignment = .left
        friendLabel.frame = CGRect(x: 10, y: 0, width: 100, height: 25)
        
        let gradientColor = CAGradientLayer()
        let colors: [UIColor] = [.blue.withAlphaComponent(0.1), .cyan.withAlphaComponent(0.5)]
        gradientColor.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25)
        gradientColor.colors = colors.map { $0.cgColor }
        gradientColor.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientColor.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        headerView.layer.addSublayer(gradientColor)
        
        headerView.addSubview(friendLabel)
        
        return headerView
    }
}

// MARK: - ViewController TableView Delegate Method
extension ViewController: UITableViewDelegate {
    // 셀이 선택되었을 때 실행할 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 뷰 모드가 노말이라면 연락처 수정 기능
        if !self.editingMode {
            let data = self.dataSource[indexPath.row]
            
            guard let name = data.name, let number = data.number, let imageData = data.profile else { return }
            guard let image = UIImage(data: imageData) else { return }
            let phoneNumber = number.split(separator: "-")
            
            // 서브뷰 업데이트 메소드 추가
            let destinationView = PhoneBookViewController()
            destinationView.editPhoneNumber(name: name, number: phoneNumber.joined(), image: image)
            destinationView.state = .edit
            
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(destinationView, animated: true)
            
        // 뷰 모드가 편집이라면 셀을 선택 삭제 목록에 추가 or 제거
        } else {
            // 선택한 셀을 삭제 목록에 추가
            // 선택한 셀이 이미 삭제 목록에 있을 경우 삭제 목록에서 제거
            guard !self.selectedItem.contains(self.dataSource[indexPath.row]) else {
                self.selectedItem.remove(self.dataSource[indexPath.row])
                tableView.reloadRows(at: [indexPath], with: .automatic)
                self.setupPushButtonView()
                return
            }
            self.selectedItem.insert(self.dataSource[indexPath.row])
            tableView.reloadRows(at: [indexPath], with: .automatic)
            self.setupPushButtonView()
        }
    }
    
    // 테이블뷰 셀을 editing 할 때 옵션 선택 = delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // 테이블뷰 셀 데이터 삭제 메소드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let data = self.dataSource[indexPath.row]
        guard let name = data.name, let number = data.number else { return }
        
        // 데이터 삭제 최종 확인
        ValidationAlert.confirmDeleteDataAlert(on: self) { [weak self] in
            guard let self else { return }
            self.tableView.beginUpdates()
            
            self.dataSource.remove(at: indexPath.row)
            self.deleteData(name: name, number: number)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            self.tableView.endUpdates()
        }
    }
}
