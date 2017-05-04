package  
{

import appManager.displayContentElemets.TitleText;

import contents.PageData;

import contents.displayPages.DynamicLinks;

import diagrams.instagram.DiagramLines;

import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.text.TextField;

import popForm.PopButton;

import serviceGenerator.models.RequestModel;

import serviceGenerator.models.ServiceModel;


public class Main extends MovieClip
	{
		private var list:DynamicLinks,
                    serviceTitleInput:TextField,
                    serverIPPort:TextField,
                    saveButton:PopButton,
                    sendButton:PopButton,
                    inputTF:TextField,
                    outPutTF:TextField,
                    requestList:DynamicLinks,
                    deleteRequest:PopButton,
                    deleteService:PopButton;

        private var services:Vector.<ServiceModel>,
                    selectedService:ServiceModel;
		
		public function Main() 
		{
			super();

            UnicodeStatic.deactiveConvertor = true ;

            list = Obj.get("service_list_mc",this);
            serviceTitleInput = Obj.get("service_name_tf",this);
            serverIPPort = Obj.get("server_port_tf",this);
            saveButton = Obj.get("save_mc",this);
            sendButton = Obj.get("send_mc",this);
            inputTF = Obj.get("input_txt",this);
            outPutTF = Obj.get("output_txt",this);
            requestList = Obj.get("request_list_mc",this);
            deleteRequest = Obj.get("delete_mc",this);
            deleteService = Obj.get("delete_service_mc",this);

            inputTF.borderColor = 0x666666;
            outPutTF.borderColor = 0x666666;

            saveButton.setUp('SAVE');
            saveButton.addEventListener(MouseEvent.CLICK, saveCurrentService);

            sendButton.setUp('SEND TO SERVER');
            sendButton.addEventListener(MouseEvent.CLICK, sendCurrentService);

            deleteRequest.setUp('DELETE REQUEST');
            deleteRequest.addEventListener(MouseEvent.CLICK, deleteCurrentRequest);

            services = new Vector.<ServiceModel>();

            loadLastServices();
            initServices();
		}

        private function deleteCurrentRequest(e:MouseEvent):void
        {
            //TODO
        }

        private function sendCurrentService(e:MouseEvent):void
        {
            //TODO
        }

        private function saveCurrentService(e:MouseEvent):void
        {
            //TODO
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
            showSelectedOne();
        }

        /**Show the selected service on the stage*/
        private function showSelectedOne():void
        {
            if(selectedService==null)
            {
                selectedService = services[0];
            }

            if(selectedService.requestsList.length==0)
            {
                selectedService.requestsList.push(new RequestModel())
            }

            serviceTitleInput.text = selectedService.title;
            serverIPPort.text = selectedService.ip+':'+selectedService.port ;
            inputTF.text = beautiFy(selectedService.requestsList[0].requestString);
            outPutTF.text = beautiFy(selectedService.requestsList[0].respondString);
        }

            /**Returns beautify json model if it can*/
            private function beautiFy(jsonModel:String):String
            {
                if(jsonModel=='')
                {
                    return '' ;
                }
                try
                {
                    var jsonObject:Object = JSON.stringify(jsonModel);
                    return JSON.stringify(jsonObject,null,'\t');
                }
                catch (e)
                {
                    trace("The json model is not parsable");
                }
                return jsonModel ;
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
