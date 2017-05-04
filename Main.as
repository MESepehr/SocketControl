package  
{

import appManager.displayContentElemets.TitleText;

import contents.displayPages.DynamicLinks;

import diagrams.instagram.DiagramLines;

import flash.display.MovieClip;
import flash.text.TextField;

import popForm.PopButton;


public class Main extends MovieClip
	{
		private var list:DynamicLinks,
                    serviceTitle:TitleText,
                    saveButton:PopButton,
                    sendButton:PopButton,
                    inputTF:TextField,
                    outPutTF:TextField,
                    requestList:DynamicLinks,
                    deleteRequest:PopButton,
                    deleteService:PopButton;

        private var services:Vector.<ServiceModel>
		
		public function Main() 
		{
			super();
            list = Obj.get("service_list_mc",this);
            serviceTitle = Obj.get("title_mc",this);
            saveButton = Obj.get("save_mc",this);
            sendButton = Obj.get("send_mc",this);
            inputTF = Obj.get("input_txt",this);
            outPutTF = Obj.get("output_txt",this);
            requestList = Obj.get("request_list_mc",this);
            deleteRequest = Obj.get("delete_mc",this);
            deleteService = Obj.get("delete_service_mc",this);
		}
	}
	
}
