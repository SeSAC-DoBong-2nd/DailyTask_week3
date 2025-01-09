//
//  UpDownGameViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

enum GameState {
    case Up
    case Down
    case Good
}

class UpDownGameViewController: UIViewController {
    
    var gameState: GameState = .Down
    var scope: Int?
    var lowCount = 1
    var tryCount = 0
    var selectedNumber = 0
    lazy var gameRandomNumber = (1...(scope ?? 1)).randomElement()
    
    //resultButton의 isEnable 상태를 판별할 변수
    var isEnableButton: Bool = false {
        didSet {
            resultButtonStatusToggle()
        }
    }
    
    //cell의 isSelected를 판별할 배열
    //뭔가 얘도 didset 걸고 새로 생성되도록 해야할 것 같은데.
    lazy var cellSelectedArr = Array(repeating: false, count: currentList.count)
    
    lazy var totalList = Array((1...(scope ?? 1)))
    lazy var currentList = totalList {
        didSet {
            gameCollectionView.reloadData()
        }
    }

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var trycountLabel: UILabel!
    @IBOutlet var gameCollectionView: UICollectionView!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRegister()
        setUI()
        setLayout()
    }
    
    func setRegister() {
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
        
        let id = GameCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        
        gameCollectionView.register(xib, forCellWithReuseIdentifier: id)
        
        resultButton.addTarget(self, action: #selector(resultButtonTapped), for: .touchUpInside)
    }
    
    func setUI() {
        view.backgroundColor = ._250109Background
        
        gameCollectionView.backgroundColor = ._250109Background
        gameCollectionView.showsHorizontalScrollIndicator = false
        
        resultLabel.setLabelUI("UP DOWN", font: .boldSystemFont(ofSize: 40), alignment: .center)
        trycountLabel.setLabelUI("시도횟수: \(tryCount)", font: .systemFont(ofSize: 20, weight: .regular), alignment: .center)
        
        resultButton.setButtonUIWithTitle(title: "결과 확인하기", titleColor: .white, backgroundColor: .lightGray, cornerRadius: 0)
        resultButton.isEnabled = isEnableButton
    }
    
    func setLayout() {
        let lineSpacing = CGFloat(10)
        let screenInset = CGFloat(10)
        let useAbleHeight = gameCollectionView.frame.height - (screenInset * 2 + lineSpacing * 4)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: screenInset, left: screenInset, bottom: screenInset, right: screenInset)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = lineSpacing
        layout.itemSize = CGSize(width: useAbleHeight/5, height: useAbleHeight/5)
        
        gameCollectionView.collectionViewLayout = layout
    }

}

//MARK: - private extension
private extension UpDownGameViewController {
    
    func resultButtonStatusToggle() {
        resultButton.isEnabled = isEnableButton
        
        let color = resultButton.isEnabled ? UIColor(.black) : UIColor(.gray)
        resultButton.backgroundColor = color
    }
    
    @objc
    func resultButtonTapped() {
        print(selectedNumber)
        tryCount += 1
        
        guard let gameRandomNumber = gameRandomNumber else {return}
        if gameRandomNumber == selectedNumber {
            gameState = .Good
        } else if gameRandomNumber > selectedNumber {
            gameState = .Up
        } else if gameRandomNumber < selectedNumber {
            gameState = .Down
        }
        
        switch gameState {
        case .Down:
            print("Down")
            currentList = Array(lowCount...selectedNumber-1)
            cellSelectedArr = Array(repeating: false, count: currentList.count)
            scope = selectedNumber-1
            resultLabel.text = "DOWN"
            trycountLabel.text = "시도횟수 : \(tryCount)"
        case .Up:
            print("Up")
            currentList = Array(selectedNumber+1...(scope ?? 2))
            cellSelectedArr = Array(repeating: false, count: currentList.count)
            lowCount = selectedNumber+1
            resultLabel.text = "UP"
            trycountLabel.text = "시도횟수 : \(tryCount)"
        case .Good:
            print("Good")
            resultLabel.text = "GOOD!"
            trycountLabel.text = "시도횟수 : \(tryCount)"
        }
    }
    
}

//MARK: - UICollectionViewDelegate
extension UpDownGameViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? GameCollectionViewCell {
            if cellSelectedArr[indexPath.item] {
                isEnableButton = false
                cell.setUI(titleColor: .black, backgroundColor: .white)
                cellSelectedArr[indexPath.item].toggle()
            } else {
                isEnableButton = true
                cell.setUI(titleColor: .white, backgroundColor: .black)
                cellSelectedArr[indexPath.item].toggle()
                selectedNumber = currentList[indexPath.item]
            }
        }
    }
    
    //해제된 cell 이벤트
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        isEnableButton.toggle()
        if let cell = collectionView.cellForItem(at: indexPath) as? GameCollectionViewCell {
            cell.setUI(titleColor: .black, backgroundColor: .white)
            cell.isSelected = false
        }
    }
    
}

//MARK: - UICollectionViewDataSource
extension UpDownGameViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        cell.titleLabel.text = String(currentList[indexPath.item])
        switch cellSelectedArr[indexPath.item] {
        case true:
            DispatchQueue.main.async {
                cell.setUI(titleColor: .white, backgroundColor: .black)
            }
        case false:
            DispatchQueue.main.async {
                cell.setUI(titleColor: .black, backgroundColor: .white)
            }
        }
        
        
        return cell
    }
    
}
