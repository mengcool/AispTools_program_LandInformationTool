AispTools_program_LandInformationTool
复合线转换宗地

2020年11月19日 23点57分
1.修正"缩放到全局窗口无法正确选择到权属线"的问题,改正为根据权属线的边界点,vla-ZoomWindow调整到权属线,
新增函数:Aisp-ZoomObject.
2.修改窗体NewDJQY,使用权地类代码:072农村宅基地,修改为:0702农村宅基地
3.c:AispTools_ZJ/NewDJQY/OK#OnClicked 修改事件 变量 zdh 表内容为 072修改为0702

2020年11月23日 21点49分 
1.修改在界址线被写入属性后,将界址线对象放入"JZD"图层
2.修改在窗体载入cad时,如果图形不存在"JZD"图层.则创建一个"JZD"图层

2020年11月30日 17点56分
1.修复创建多个地籍区域无法正确识别宗地号的问题.
2.修改"开始转换"按钮键入并且在授权码输入正确后,重新设置 "转换前最后检查" "开始转换" 按钮为不可用状态

2020年12月1日 21点27分
1.修正加载opendcl运行库无法正确识别cad2016版本20的错误
