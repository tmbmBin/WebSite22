// JScript source code by nickey 99.1.6
// email:nickey@ms50.url.com.tw

//SetFlag:0.Paste+Keep,1.ReSet+Keep,2.Copy,3.Keep,4.Copy+Keep,5.ReSet+Keep+Copy
//NotRunEventFlag:true=run:onchange or onblur
function TablePaste(parObj,Str,SetFlag,NotRunEventFlag)
{var setObj,TBObj = FindTagName(parObj,"TABLE");
 if(!TBObj) return false;
 if(SetFlag==1||SetFlag==5) //ReSet
                 {if(typeof(TBObj.OldStr)!="undefined") Str=TBObj.OldStr; 
                  if(SetFlag==1&&Str==null) return false; 
                 } 
 else if(SetFlag!=2&&SetFlag!=3&&SetFlag!=4&&Str==null)  //Paste
          Str=clipboardData.getData('Text')+"";
 var CellStrs=null,RowStrs;
 var RowIdx=0,CellIdx=0;
 if(Str==null) RowStrs=null;
 else if(Str.indexOf("\r\n")) RowStrs=Str.split("\r\n");
 else RowStrs=Str.split("\n");
 if(RowStrs) CellStrs=RowStrs[0].split("\t");
 var OldStr=""; 
 var i,j,k; 
 for(i=0;i<TBObj.rows.length;i++)
 {for(j=0;j<TBObj.rows[i].cells.length;j++)
   {setObj=TBObj.rows[i].cells[j].all;    
    for(k=0;k<setObj.length;k++)
     { if(isEdit(setObj[k]))
       { var OldVal="";
         var Val=null;         
         try{
         if(CellStrs&&CellIdx<CellStrs.length) Val=CellStrs[CellIdx];
         if(setObj[k].options)
           {if(setObj[k].selectedIndex>=0) 
             OldVal=setObj[k].options[setObj[k].selectedIndex].text;            
            if(Val!=null)
            {var m,ValIdx=-1;
             for(m=0;m<setObj[k].options.length;m++)
              { //alert("["+setObj[k].options[m].text+"]=["+Val+"]=="+(setObj[k].options[m].text==Val));
                if(setObj[k].options[m].value==Val) ValIdx=m;
                if(setObj[k].options[m].text==Val) break;                
              }              
            //if(m>=setObj[k].options.length) 
            //{setObj[k].options.length++;
            // setObj[k].options[m].text=Val;
            // setObj[k].options[m].value=Val;
            //}
            if(m<setObj[k].options.length) setObj[k].selectedIndex=m;
            else if(ValIdx>=0) setObj[k].selectedIndex=ValIdx;
            }//val
           }else
           if(setObj[k].type=="checkbox"||setObj[k].type=="radio")
           {  OldVal=(setObj[k].checked)?1:0;
              if(Val!=null) setObj[k].checked=(Val&&(Val!=0||Val.toUpperCase()=="TRUE"||Val.toUpperCase()=="T"||Val.toUpperCase()=="V"))?true:false;                         
           }
           else 
           {OldVal=setObj[k].value;            
            if(Val!=null) setObj[k].value=Val;
           }
           
           if(CellIdx) OldStr=OldStr+"\t";
           else if(RowIdx) OldStr=OldStr+"\r\n";
           OldStr=OldStr+OldVal.toString();
           if(!NotRunEventFlag)
           {if(setObj[k].onclick) try{ setObj[k].onclick(); }catch(e){;}       
            if(setObj[k].onblur) try{ setObj[k].onblur(); }catch(e){;}       
            if(setObj[k].onchange) try{ setObj[k].onchange(); }catch(e){;}       
           }  
           CellIdx++;                  
          }catch(e){;} 
        }//if   
     }//for-k
   }//for-j
   if(CellIdx)
   { RowIdx++;
     if(RowStrs&&RowIdx<RowStrs.length)
          CellStrs=RowStrs[RowIdx].split("\t");
     else CellStrs=null;
     CellIdx=0;
   }
 }//for-i

 if(SetFlag==2||SetFlag==4||SetFlag==5) clipboardData.setData('Text',OldStr); //copy
 if(SetFlag!=2)  TBObj.OldStr=OldStr;
 return TBObj.OldStr;
}
function isEdit(setObj)
{if(!setObj) return false;
 if(!setObj.form) return false;//INPUT
 if(!setObj.type) return false;
 if(setObj.disabled) return false; 
 if(setObj.type=='hidden') return false;
 if(setObj.readOnly) return false;
 while(setObj)
 {if(setObj.style&&setObj.style.display=='none') return false;
  setObj = setObj.parentNode;
 }
 return true;
}