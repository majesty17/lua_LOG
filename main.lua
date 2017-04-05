-- name    《光明大陆》辅助
-- author  Etrom
-- date    2017/4/4
-- info    for ipad air 2 :2048×1536

require "TSLib"

--做一些初始化
init("0", 1);			--指定坐标系，横屏home右
--setDeviceOrient(1);
luaExitIfCall(true);

skpos={{1607,1401},{1630,1235},{1744,1112},{1915,1095}}




--显示主对话框
function show_dialog()
	local sz = require("sz")
	local json = sz.json
	MyTable = {
		["style"] = "default",
		["width"] = 850,
		["height"] = 390,
		["orient"] = 1,
		["config"] = "save_loghelper.dat",
		["timer"] = 99,
		["title"] = "《光明大陆》辅助 - by Etrom",
		views = {
			{
				["type"] = "RadioGroup",
				["list"] = 	"技能组合1,技能组合2,技能组合3,技能组合4",
				["select"] = "1",
			},
			{
                ["type"] = "Edit",
                ["text"] = "2534",
				["width"] = 175,
                ["kbtype"] = "number",
				["nowrap"] = 1,
            },
			{
                ["type"] = "Edit",
                ["text"] = "1534",
				["width"] = 175,
                ["kbtype"] = "number",
				["nowrap"] = 1,
            },
			{
                ["type"] = "Edit",
                ["text"] = "6534",
				["width"] = 175,
                ["kbtype"] = "number",
				["nowrap"] = 1,
            },
			{
                ["type"] = "Edit",
                ["text"] = "7534",
				["width"] = 175,
                ["kbtype"] = "number",
            },
		}
	}
	local MyJsonString = json.encode(MyTable);
	return showUI(MyJsonString);
end


function changeskill(extra)
	x=510
	y=690
	r=320
	
	tap(2013,381);
	tap(1729,543);
	mSleep(800);
	tap(245,1050);
	mSleep(100);
	for i=1, 4 do
		ind=string.sub(extra,i,i);
		n = tonumber(ind);
		tap(x+r*math.sin(math.pi/4*(n-1)),y-r*math.cos(math.pi/4*(n-1)))
		mSleep(50)
		tap(skpos[i][1],skpos[i][2]);
	end
	
	tap(1928,290);
	tap(1928,290);
end



function main()
	--测试区
	--action_clean_bag();
	--return;
	--测试区
	
	--弹出主程序面板
	ret, skillset, ext1, ext2, ext3 ,ext4= show_dialog();
	if ret==1 then
		if skillset=="0" then
			changeskill(ext1);
		end
		if skillset=="1" then
			changeskill(ext2);
		end
		if skillset=="2" then
			changeskill(ext3);
		end
		if skillset=="3" then
			changeskill(ext4);
		end
	end

end



main();
