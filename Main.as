package  
{

import appManager.displayContentElemets.TitleText;

import contents.PageData;

import contents.displayPages.DynamicLinks;

import diagrams.instagram.DiagramLines;

import flash.display.MovieClip;
import flash.text.TextField;

import popForm.PopButton;

import serviceGenerator.models.ServiceModel;


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

            inputTF.borderColor = 0x666666;
            outPutTF.borderColor = 0x666666;

            services = new Vector.<ServiceModel>();

            loadLastServices();
            initServices();
		}

        /**Loasd services from storage*/
        private function loadLastServices():void
        {
            //TODO
        }

        private function initServices():void
        {
            if(services.length==0)
            {
                services.push(new ServiceModel());
            }
            updateServiceModelList();
        }

        private function updateServiceModelList():void
        {
            var listPageData:PageData = new PageData();
            services.sort(sortByTitle)
            for(var i = 0 ; i<services.length ; i++)
            {
                listPageData.links1.push(services[i].linkData())
            }
            list.setUp(listPageData);
        }

            /**Service model's sort function*/
            private function sortByTitle(a:ServiceModel,b:ServiceModel):int
            {
                if(a.title>b.title)
                {
                    return 1;
                }
                else if(a.title<b.title)
                {
                    return -1
                }
                return 0 ;
            }
	}
	
}
