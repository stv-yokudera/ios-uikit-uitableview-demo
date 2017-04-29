# UITableView

## 概要
UITableViewはテーブル形式のViewを管理するクラスです。

## 関連クラス
UIScrollView

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|-----------|------------|------------|
| delegate | delegateを設定する | tableView.delegate |
| dataSource | dataSourceを指定する | tableView.titleView |
| allowsSelection | セルの選択可否 | tableView.allowsSelection |

## 主要メソッド

| メソッド名 | 説明 | サンプル |
|-----------|------------|------------|
| deselectRow(at:animated:) | セルの選択状態を解除する | tableView.deselectRow(at: indexPath, animated: true) |
| reloadData() | tableViewを更新する | tableView.reloadData() |
| reloadSections(_:with:) | 指定したセクションを更新する（アニメーション指定可能） | |
| reloadRows(at:with:) | 指定した行を更新する（アニメーション指定可能） | |

## 主要DataSourceメソッド

| メソッド名 | 説明 | 実装必須 |
|-----------|------------|------------|
| numberOfSections(in:) | セクション数を返す | ◯ |
| tableView(_:numberOfRowsInSection:) | セクションごとのセル数を返す | - |
| tableView(_:titleForHeaderInSection:) | セクションのタイトルを返す | - |
| tableView(_:cellForRowAt:) | セルの内容を返す | ◯ |

## 主要Delegateメソッド

| メソッド名 | 説明 |
|-----------|------------|
| tableView(_:heightForRowAt:) | セルの高さを返す |
| tableView(_:didSelectRowAt:) | セルタップ時に呼ばれる |
| tableView(_:willDisplay:forRowAt:) | セル表示直前に呼ばれる |

## フレームワーク
UIKit.framework

## サポートOSバージョン
iOS2.0以上

## 開発環境
| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |

## 参考
https://developer.apple.com/reference/uikit/uitableview

# UITableViewCell

## 概要
UITableViewCellはUITableViewに表示するセルを管理するクラスです。

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|-----------|------------|------------|
| isSelected | 選択されているかどうか | cell.isSelected |
| isHighlighted | ハイライト状態かどうか | cell.isHighlighted |
| selectionStyle | セル選択時の色を設定 | cell.selectionStyle = .none |

## 主要メソッド

| メソッド名 | 説明 |
|-----------|------------|
| setSelected(_:animated:) | セルの選択状態を設定する（アニメーション指定可能） |

## フレームワーク
UIKit.framework

## サポートOSバージョン
iOS2.0以上

## 開発環境
| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |

## 参考
https://developer.apple.com/reference/uikit/uitableviewcell

# UIRefreshControl

## 概要
UIRefreshControlはUITableViewのリフレッシュを管理するクラスです。

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|-----------|------------|------------|
| attributedTitle | refreshControlに表示される文言 | refreshControl.attributedTitle |
| isRefreshing | リフレッシュ中かどうか | refreshControl.isRefreshing |

## 主要メソッド

| メソッド名 | 説明 | サンプル |
|-----------|------------|------------|
| beginRefreshing() | リフレッシュを開始する | refreshControl.beginRefreshing() |
| endRefreshing() | リフレッシュを終了する | refreshControl.endRefreshing() |

## フレームワーク
UIKit.framework

## サポートOSバージョン
iOS6.0以上

## 開発環境
| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |

## 参考
https://developer.apple.com/reference/uikit/uirefreshcontrol

