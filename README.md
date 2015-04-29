DaiSurvivor
======

Help your apps survive in the background!!

幫助你的 app 在背景中生存!!

DaidoujiChen

daidoujichen@gmail.com

總覽
======
利用 gps 的技巧, 讓 app 可以用盡量少量的電力, 在背景繼續工作, 不過沒有絕對保證, 因為系統要殺的話, 還是可以硬把你殺掉, 就斟酌點用吧.

使用前, 專案的部分有幾個部分需要設定,

1. 需要開啟背景 `Location updates` 的權限 ![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2015-04-29+%E4%B8%8B%E5%8D%885.45.55.png)
2. 在 ios8 之後, plist 有個 key 值 `NSLocationAlwaysUsageDescription` 需要設定, 後面帶的 `String` 則是你在跟使用者要權限時的說明 ![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2015-04-29+%E4%B8%8B%E5%8D%885.48.12.png)

另外, 需要額外的寫一段 `isNeedAliveInBackground`

	[DaiSurvivor shared].isNeedAliveInBackground = ^BOOL (void) {
		return YES;
	};
	
來決定是不是要活在背景, 回 `YES` 則是要, 這邊可以依照實際運行時的情況, 來決定需不需要背景作業

最後 `totalAliveTime` 可用可不用

	[DaiSurvivor shared].totalAliveTime = ^(NSTimeInterval aliveTime) {
		NSLog(@"alive in background : %f sec", aliveTime);
	};
	
主要只是在把 app 活了多久讓你知道, 如果沒有到這邊, app 可能早就死掉了.


支援
======
只有在 8.0 以上的機器測試過.
  
