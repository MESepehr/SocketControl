/**
 * Created by mes on 5/4/2017.
 */
package serviceGenerator.models {
import contents.LinkData;

public class ServiceModel {

    public var title:String = '[NO NAME]' ;

    public var requestsList:Vector.<RequestModel> = new <RequestModel>[];

    public var ip:String = '0.0.0.0';
    public var port:String = '8020';


    private var _imSelected:Boolean,
                _myLinkDataModel:LinkData;


    public function ServiceModel() {
        _myLinkDataModel = new LinkData();
        _myLinkDataModel.dynamicData = this ;
    }

    public function linkData():LinkData
    {
        _myLinkDataModel.name = title ;
        return _myLinkDataModel
    }

    /**Select the service*/
    public function select(selectStatus:Boolean):void
    {
        _imSelected = selectStatus ;
    }

    public function isSelected():Boolean
    {
        return _imSelected ;
    }

}
}
