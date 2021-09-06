// An Example to show how to set entry content in a dialog
// version 2 :Using DLGIdentifier and LookUpElement
//
// Renfong
// 2021/09/06

class TestUI : UIFrame	{
	number true, false, ver
	
	TestUI(object self){
		true=1; false=0; ver=2.0
		result("TestUI ["+self.ScriptObjectGetID()+"] constructed\n")
	};
	
	~TestUI(object self){
		result("TestUI ["+self.ScriptObjectGetID()+"] destructed\n")
	};
	
	void GetImgName(object self)	{
		image src := GetFrontImage()
		self.LookupElement("EntryText").DLGValue(src.GetName())
	};
	
	void CreateDialog(object self)	{
		String UIName = "TestUI"
		TagGroup MainUI = DLGCreateDialog(UIName)
		
		TagGroup tgBox = DLGCreateBox("Func")
		TagGroup tgLabel = DLGCreateLabel("GetName : ")
		TagGroup tgEntry = DLGCreateStringField(" ",50).DLGIdentifier("EntryText")
		
		tgBox.DLGAddElement(DLGGroupItems(tgLabel,tgEntry).DLGTableLayout(2,1,0))
		
		TagGroup tgBtn = DLGCreatePushButton("GetFrontImage()","GetImgName")
		tgBox.DLGAddElement(tgBtn)
		
		MainUI.DLGAddElement(tgBox)
		self.init(MainUI).Display(UIName+"_v"+ver.format("%.1f"))
	};
};

{
	Alloc(TestUI).CreateDialog()
}