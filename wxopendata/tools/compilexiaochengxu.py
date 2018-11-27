import os
import shutil
import sys

compileExe="laya.js.exe"
projectPath="C:/Users/Administrator/Desktop/lan/as3/main2/main2.as3proj"
jsFilePath="C:/Users/Administrator/Desktop/lan/as3/main2/bin/h5/main2.max.js";
targetFilePath="C:/Users/Administrator/Desktop/lan/as3/main_minigame/src/myOpenDataContext/";
compileParam=projectPath+";iflash=false;chromerun=false;";

def copyFiles(sourceDir,  targetDir): 
    if sourceDir.find(".svn") > 0: 
        return 
    for file in os.listdir(sourceDir): 
        sourceFile = os.path.join(sourceDir,  file) 
        targetFile = os.path.join(targetDir,  file) 
        if os.path.isfile(sourceFile): 
            if not os.path.exists(targetDir):  
                os.makedirs(targetDir)  
            if not os.path.exists(targetFile) or(os.path.exists(targetFile) and (os.path.getsize(targetFile) != os.path.getsize(sourceFile))):  
                    open(targetFile, "wb").write(open(sourceFile, "rb").read()) 
        if os.path.isdir(sourceFile): 
            First_Directory = False 
            copyFiles(sourceFile, targetFile)
            
def copyFileToTar(srcFile,tarFile):
    print("copyFileToTar",srcFile,tarFile);
    if os.path.exists(srcFile):
        pass;
    else:
        print("!exitst:",srcFile)
        return;

    if os.path.isdir(srcFile):
        copyFiles(srcFile,tarFile);
    else:
        shutil.copyfile(srcFile,tarFile);


def workGlobalJob(code):
    arrs=code.split("laya.")
    newArr=[];
    for tCode in arrs:
        newArr.append(tCode)
        if tCode[-1]=="'" or tCode[-1]=="\"":
            newArr.append("laya.")
        else:
            newArr.append("global.laya.")
    newArr.pop()
    return "".join(newArr);

def removeClass(clzName,code):
    clzStart="var "+clzName+"=(function(_super){"
    clzEnd="return "+clzName+";"
    startPos=code.find(clzStart)
    endPos=code.find(clzEnd)
    rightPos=code.find("/**",endPos)
    print("codePos:",startPos,endPos,rightPos)
    preCode=code[0:startPos]
    nextCode=code[rightPos:]
    return preCode+"\n"+nextCode

def replaceClass(preClz,newClz,code):
    code=removeClass(preClz,code)
    code=code.replace(newClz,preClz)
    return code
    
def adptJs():
    print("adptjs")
    prefile=jsFilePath
    
    fileName=os.path.basename(prefile)
    print("fileName",fileName)
    newfile=jsFilePath.replace(fileName,"indexlayaair.js");
    f=open(prefile,"r",encoding= 'utf8')
    ct=f.read()
    f.close()
    nct=ct
    replaces=[]
    doGlobal=True
    #doGlobal=False
    addGlobals=[]
    replaces.append(["LayaUISample.isWXAPP=false;","LayaUISample.isWXAPP=true;"]);
    replaces.append(["Object.defineProperty(o,name,{get:getfn,set:setfn,enumerable:false});","Object.defineProperty(o,name,{get:getfn,set:setfn,enumerable:false,configurable: true});"]);
    replaces.append(["Object.defineProperty(o,name,{get:getfn,enumerable:false});","Object.defineProperty(o,name,{get:getfn,enumerable:false,configurable: true});"]);
    replaces.append(["Object.defineProperty(o,name,{set:setfn,enumerable:false});","Object.defineProperty(o,name,{set:setfn,enumerable:false,configurable: true});"]);
    for rps in addGlobals:
        replaces.append([rps,"global."+rps]);
    for rps in replaces:
        print(rps)
        nct=nct.replace(rps[0],rps[1])

    toComments=[]
    toComments.append("if(!flag){meta=document.createElement")
    for cmts in toComments:
        nct=nct.replace(cmts,"//"+cmts)
    f=open(newfile,"w",encoding= 'utf8')
    f.write(nct)
    f.close()
    newfile=targetFilePath+"/indexlayaair.js";
    f=open(newfile,"w",encoding= 'utf8')
    f.write(nct)
    f.close()
    

os.system(compileExe+" "+compileParam)
print("compile complete");
adptJs()
print("workDone");
