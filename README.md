# UICollectionViewCompositionalLayout
UICollectionViewCompositionalLayout에 대한 공부를 합니다.

## Navigation

[1. Preview](#Preview)   
[2. UICollectionViewCompositionalLayout](#UICollectionViewCompositionalLayout)   
[3. NSCollectionLayoutDimension](#NSCollectionLayoutDimension)   
[4. Conclusion](#Conclusion)   

## Preview
<img width="40%" height="60%" src="https://user-images.githubusercontent.com/76255765/170684083-f2cd92c8-4020-49fa-b648-1c9f777979a9.gif"/>   
위 컬렉션뷰처럼 구성된 레이아웃을 만들 때 원래의 방식대로면 중첩 컬렉션뷰를 사용해야 합니다.   

하지만 <code>UICollectionViewCompositionalLayout</code>를 사용하면 훨씬 간단하게 구성할 수 있습니다.   

먼저 <code>UICollectionViewCompositionalLayout</code>는 WWDC19에서 소개된 내용입니다.

iOS 13 이상부터 사용이 가능한 기능이며, 복잡한 컬렉션뷰를 구성할 때 사용하기 좋습니다.

이 레이아웃을 사용하기 전에 먼저 알아야 할 개념들이 존재합니다. ( [여기](https://developer.apple.com/documentation/uikit/uicollectionviewcompositionallayout)를 보시면 좋습니다. )

<img src="https://docs-assets.developer.apple.com/published/2308306163/rendered2x-1585241228.png" width="250px" />

<code>Item</code>은 <code>Group</code>라는 레이아웃에 속해 있고, <code>Group</code>은 <code>Section</code>이라는 레이아웃에 속해 있습니다.

<code>Section</code>을 만드려면 Group이 필요하고, <code>Group</code>를 만드려면 Item이 필요합니다.

## UICollectionViewCompositionalLayout
### Section(NSCollectionLayoutSection)
Group을 받습니다. CollectionView에는 하나 이상의 섹션이 존재할 수 있으며, 섹션을 통해 각 레이아웃의 영역을 구분합니다. 섹션은 NSCollectionLayoutGroup을 상속받습니다.

### Group(NSCollectionLayoutGroup)
Item을 받는 컨테이너입니다. NSCollectionLayoutDimension으로 크기를 결정하며, 특정 경로에 아이템을 배치하는 역할을 합니다.

### Item(NSCollectionLayoutItem)
가장 기본이 되는 요소입니다. NSCollectionLayoutDimension으로 크기를 결정하며, 기본적으로 항목은 셀입니다.

또한 셀의 크기를 결정지어주는 요소들에 대한 개념을 알고 들어가야 합니다.
  
## NSCollectionLayoutDimension
**.absolute**  
항상 고정 크기를 계산합니다.
  
**.estimated**   
런타임에 따른 크기 결정. 시스템 예상 크기를 기반으로 실제 크기를 계산합니다.

**.fractional**   
속해 있는 레이아웃의 그룹의 크기 비율만큼 크기를 계산합니다. 가장 추천하는 방식이며, 자신이 속한 컨테이너의 크기에 따른 비율에 따라 크기를 결정합니다. 값은 0 ~ 1 입니다.

<pre><code>
let item: NSCollectionLayoutItem = .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
item.contentInsets.leading = 10
item.contentInsets.bottom = 5
let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(200)), subitems: [item])
let section = NSCollectionLayoutSection(group: group)
section.orthogonalScrollingBehavior = .groupPaging
return section
</code></pre>

## Conclusion
처음엔 낯설지만 적응이 되면 복잡한 레이아웃을 손쉽게 구현 가능합니다. 자세한 사용방법은 [여기](https://www.raywenderlich.com/5436806-modern-collection-views-with-compositional-layouts)를 참고하세요.
