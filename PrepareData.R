## 读取数据
CTB<-read.table("/Users/shihchosen/Documents/R/R-workplace/CTB/data/CTB151016.txt", 
                sep = "\t", stringsAsFactors = FALSE, header = TRUE)
# 选择要分析的变量
myvars<-c("代码", "名称", "发行总额.亿元." ,"期限.年." ,"票面利率.发行参考利率....", "息票品种" , "付息频率" ,
          "发行日期",  "到期日期",  "债券信用评级", "债券评级机构","债券评级类型" , "主体信用评级",
          "主体评级类型","主体评级机构","担保方式" ,"是否跨市场" , "GICS二级行业", "GICS三级行业",
          "上市日期","发行人",  "发行人类型", "交易市场", "交易状态","债券类型" ,"省份","城市") 
CTB<-CTB[myvars]

# 使用评级机构的简称(债项评级)
CTB$债券评级机构[CTB$债券评级机构=="大公国际资信评估有限公司"]<-"大公国际"
CTB$债券评级机构[CTB$债券评级机构=="东方金诚国际信用评估有限公司"]<-"东方金诚"
CTB$债券评级机构[CTB$债券评级机构=="联合信用评级有限公司"]<-"联合评级"
CTB$债券评级机构[CTB$债券评级机构=="联合资信评估有限公司"]<-" 联合资信"
CTB$债券评级机构[CTB$债券评级机构=="上海新世纪资信评估投资服务有限公司"]<-"上海新世纪"
CTB$债券评级机构[CTB$债券评级机构=="鹏元资信评估有限公司"]<-"鹏元资信"
CTB$债券评级机构[CTB$债券评级机构=="中诚信国际信用评级有限责任公司"]<-"中诚信国际"
CTB$债券评级机构[CTB$债券评级机构=="中诚信证券评估有限公司"]<-"中诚信证券"
#使用评级机构的简称(主体评级)
CTB$主体评级机构[CTB$主体评级机构=="大公国际资信评估有限公司"]<-"大公国际"
CTB$主体评级机构[CTB$主体评级机构=="东方金诚国际信用评估有限公司"]<-"东方金诚"
CTB$主体评级机构[CTB$主体评级机构=="联合信用评级有限公司"]<-"联合评级"
CTB$主体评级机构[CTB$主体评级机构=="联合资信评估有限公司"]<-" 联合资信"
CTB$主体评级机构[CTB$主体评级机构=="上海新世纪资信评估投资服务有限公司"]<-"上海新世纪"
CTB$主体评级机构[CTB$主体评级机构=="鹏元资信评估有限公司"]<-"鹏元资信"
CTB$主体评级机构[CTB$主体评级机构=="中诚信国际信用评级有限责任公司"]<-"中诚信国际"
CTB$主体评级机构[CTB$主体评级机构=="中诚信证券评估有限公司"]<-"中诚信证券"

library(lubridate)

CTB$Year.Public <- year(CTB$发行日期)
Quarter <- quarters(as.Date(CTB$发行日期))
CTB$Quarter <- paste(CTB$Year.Public, Quarter, sep = "")
CTB$Year.Mature <- year(CTB$到期日期)
names(CTB)<-c("Code", "Name", "Size", "Term", "Rate", "Rate.Type", "Rate.Freq","Date.Public", "Date.Matrue",
              "BondRank", "BondRank.Ins","BondRank.Type",
              "IssuerRank","IssuerRank.Type","IssuerRank.Ins","WarrantType", 
              "IntMkt", "GICS.II", "GICS.III", "Date.Launch", "Issuer",
              "IssuerType", "MKT", "State", "BondType", "Prov","City","Year.Public","QRT.Public" ,"Year.Mature")

