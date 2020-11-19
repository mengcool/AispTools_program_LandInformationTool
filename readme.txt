AispTools_program_LandInformationTool
复合线转换宗地

2020年11月19日 23点57分
1.修正"缩放到全局窗口无法正确选择到权属线"的问题,改正为根据权属线的边界点,vla-ZoomWindow调整到权属线,
新增函数:Aisp-ZoomObject.
2.修改窗体NewDJQY,使用权地类代码:072农村宅基地,修改为:0702农村宅基地
3.c:AispTools_ZJ/NewDJQY/OK#OnClicked 修改事件 变量 zdh 表内容为 072修改为0702