// An Example to show how to set entry content in a dialog
//
// Renfong
// 2021/09/06

class TestUI : UIFrame	{
	number true, false, ver
	TagGroup EntryText
	
	TestUI(object self){
		true=1; false=0; ver=1.0
		result("TestUI ["+self.ScriptObjectGetID()+"] constructed\n")
	};
	
	~TestUI(object self){
		result("TestUI ["+self.ScriptObjectGetID()+"] destructed\n")
	};
	
	void GetImgName(object self)	{
		image src := GetFrontImage()
		EntryText.DLGValue(src.GetName())
	};
	
	void CreateDialog(object self)	{
		String UIName = "TestUI"
		TagGroup MainUI = DLGCreateDialog(UIName)
		
		TagGroup tgBox = DLGCreateBox("Func")
		TagGroup tgEntry = DLGCreateStringField("GetName :", EntryText, "?", 20)
		TagGroup tgBtn = DLGCreatePushButton("GetFrontImage()","GetImgName")
		tgBox.DLGAddElement(tgEntry)
		tgBox.DLGAddElement(tgBtn)
		
		MainUI.DLGAddElement(tgBox)
		self.init(MainUI).Display(UIName+"_v"+ver.format("%.1f"))
	};
};

{
	Alloc(TestUI).CreateDialog()
}
