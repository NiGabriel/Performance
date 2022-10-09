package mypackage;

public class user {

    int id, stid, sid, aid, dpid, pid, rolid, catid, goal, weight, assgoal, assweight, pendgoal, pendweight, rankgoal, fgoal, hrid, feedid;

    String name;
    String email;
    String password;
    String role;
    String tel;
    String level;
    String lid, lname, llevel, lbirth, lfather, lmother;
    String stuname, stpass, stfname, stlname, stposition, stdepartmentname, sttel, stemail, stroln;
    String hruname, hrpass, hrfname, hrlname, hrtel, hremail, hrrole;
    String suname, spass, sfname, slname, sposition, stel, semail, sroln, sdepartment;
    String auname, apass, afirstname, alastname, aposition, arole;
    String dpname;
    String pname;
    String rolename;
    String catname;
    String firstname, lastname;
    String telephone, position;
    String description, target, category, idate, edate, miledep;
    String assdescription, asstarget, asscategory, assidate, assedate, staffname, assdepname;
    String penddescription, pendtarget, pendachieved, pendcategory, pendidate, staffnamep, penddepname;
    String rankdescription, ranktarget, rankachieved, rankcategory, rankidate, rankdate, rankstaffname, rankdepname, rankcomment;
    double rankweightVal, rankmidyratingVal, rankendyratingVal, rankaverageannualscore, ranktotalpoint;
    String fdescription, ftarget, fachieved, fcategory, fidate, fstaffname, fdepname;
    double fweightVal;
    String feedstname, feeddescription, feeddate, feeddepname;

    int departmentid;
    String CatTest;

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAuname() {
        return auname;
    }

    public void setAuname(String auname) {
        this.auname = auname;
    }

    public String getApass() {
        return apass;
    }

    public void setApass(String apass) {
        this.apass = apass;
    }

    public String getAfirstname() {
        return afirstname;
    }

    public void setAfirstname(String afirstname) {
        this.afirstname = afirstname;
    }

    public String getAlastname() {
        return alastname;
    }

    public void setAlastname(String alastname) {
        this.alastname = alastname;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSuname() {
        return suname;
    }

    public void setSuname(String suname) {
        this.suname = suname;
    }

    public String getSpass() {
        return spass;
    }

    public void setSpass(String spass) {
        this.spass = spass;
    }

    public String getSfname() {
        return sfname;
    }

    public void setSfname(String sfname) {
        this.sfname = sfname;
    }

    public String getSlname() {
        return slname;
    }

    public void setSlname(String slname) {
        this.slname = slname;
    }

    public String getSposition() {
        return sposition;
    }

    public void setSposition(String sposition) {
        this.sposition = sposition;
    }

    public String getSemail() {
        return semail;
    }

    public void setSemail(String semail) {
        this.semail = semail;
    }

    public String getStel() {
        return stel;
    }

    public void setStel(String stel) {
        this.stel = stel;
    }

    public String getSroln() {
        return sroln;
    }

    public void setSroln(String sroln) {
        this.sroln = sroln;
    }

    public String getSdepartment() {
        return sdepartment;
    }

    public void setSdepartment(String sdepartment) {
        this.sdepartment = sdepartment;
    }

    public int getStid() {
        return stid;
    }

    public void setStid(int stid) {
        this.stid = stid;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public String getStpass() {
        return stpass;
    }

    public void setStpass(String stpass) {
        this.stpass = stpass;
    }

    public String getStdepartmentname() {
        return stdepartmentname;
    }

    public void setStdepartmentname(String stdepartmentname) {
        this.stdepartmentname = stdepartmentname;
    }

    public String getStfname() {
        return stfname;
    }

    public void setStfname(String stfname) {
        this.stfname = stfname;
    }

    public String getStlname() {
        return stlname;
    }

    public void setStlname(String stlname) {
        this.stlname = stlname;
    }

    public String getStposition() {
        return stposition;
    }

    public void setStposition(String stposition) {
        this.stposition = stposition;
    }

    public String getStemail() {
        return stemail;
    }

    public void setStemail(String stemail) {
        this.stemail = stemail;
    }

    public String getSttel() {
        return sttel;
    }

    public void setSttel(String sttel) {
        this.sttel = sttel;
    }

    public String getStroln() {
        return stroln;
    }

    public void setStroln(String stroln) {
        this.stroln = stroln;
    }

    public user() {
    }

    public user(String role) {
        this.role = role;
    }

    public user(int id, String name, String email, String password, String role, String tel, String level) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.tel = tel;
        this.level = level;
    }

    public String getLid() {
        return lid;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getLlevel() {
        return llevel;
    }

    public void setLlevel(String llevel) {
        this.llevel = llevel;
    }

    public String getLbirth() {
        return lbirth;
    }

    public void setLbirth(String lbirth) {
        this.lbirth = lbirth;
    }

    public String getLfather() {
        return lfather;
    }

    public void setLfather(String lfather) {
        this.lfather = lfather;
    }

    public String getLmother() {
        return lmother;
    }

    public void setLmother(String lmother) {
        this.lmother = lmother;
    }

    public user(String name, String email, String password, String role, String tel, String level) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.tel = tel;
        this.level = level;
    }

    public user(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getDpname() {
        return dpname;
    }

    public void setDpname(String dpname) {
        this.dpname = dpname;
    }

    public int getDpid() {
        return dpid;
    }

    public void setDpid(int dpid) {
        this.dpid = dpid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getAposition() {
        return aposition;
    }

    public void setAposition(String aposition) {
        this.aposition = aposition;
    }

    public String getArole() {
        return arole;
    }

    public void setArole(String arole) {
        this.arole = arole;
    }

    public int getRolid() {
        return rolid;
    }

    public void setRolid(int rolid) {
        this.rolid = rolid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }

    public int getGoal() {
        return goal;
    }

    public void setGoal(int goal) {
        this.goal = goal;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getIdate() {
        return idate;
    }

    public void setIdate(String idate) {
        this.idate = idate;
    }

    public String getEdate() {
        return edate;
    }

    public void setEdate(String edate) {
        this.edate = edate;
    }

    public String getMiledep() {
        return miledep;
    }

    public void setMiledep(String miledep) {
        this.miledep = miledep;
    }

    public int getAssgoal() {
        return assgoal;
    }

    public void setAssgoal(int assgoal) {
        this.assgoal = assgoal;
    }

    public int getAssweight() {
        return assweight;
    }

    public void setAssweight(int assweight) {
        this.assweight = assweight;
    }

    public String getAssdescription() {
        return assdescription;
    }

    public void setAssdescription(String assdescription) {
        this.assdescription = assdescription;
    }

    public String getAsstarget() {
        return asstarget;
    }

    public void setAsstarget(String asstarget) {
        this.asstarget = asstarget;
    }

    public String getAsscategory() {
        return asscategory;
    }

    public void setAsscategory(String asscategory) {
        this.asscategory = asscategory;
    }

    public String getAssidate() {
        return assidate;
    }

    public void setAssidate(String assidate) {
        this.assidate = assidate;
    }

    public String getAssedate() {
        return assedate;
    }

    public void setAssedate(String assedate) {
        this.assedate = assedate;
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname;
    }

    public String getAssdepname() {
        return assdepname;
    }

    public void setAssdepname(String assdepname) {
        this.assdepname = assdepname;
    }

    public int getPendgoal() {
        return pendgoal;
    }

    public void setPendgoal(int pendgoal) {
        this.pendgoal = pendgoal;
    }

    public int getPendweight() {
        return pendweight;
    }

    public void setPendweight(int pendweight) {
        this.pendweight = pendweight;
    }

    public String getPenddescription() {
        return penddescription;
    }

    public void setPenddescription(String penddescription) {
        this.penddescription = penddescription;
    }

    public String getPendtarget() {
        return pendtarget;
    }

    public void setPendtarget(String pendtarget) {
        this.pendtarget = pendtarget;
    }

    public String getPendachieved() {
        return pendachieved;
    }

    public void setPendachieved(String pendachieved) {
        this.pendachieved = pendachieved;
    }

    public String getPendcategory() {
        return pendcategory;
    }

    public void setPendcategory(String pendcategory) {
        this.pendcategory = pendcategory;
    }

    public String getPendidate() {
        return pendidate;
    }

    public void setPendidate(String pendidate) {
        this.pendidate = pendidate;
    }

    public String getStaffnamep() {
        return staffnamep;
    }

    public void setStaffnamep(String staffnamep) {
        this.staffnamep = staffnamep;
    }

    public String getPenddepname() {
        return penddepname;
    }

    public void setPenddepname(String penddepname) {
        this.penddepname = penddepname;
    }

    public int getRankgoal() {
        return rankgoal;
    }

    public void setRankgoal(int rankgoal) {
        this.rankgoal = rankgoal;
    }

    public String getRankdescription() {
        return rankdescription;
    }

    public void setRankdescription(String rankdescription) {
        this.rankdescription = rankdescription;
    }

    public String getRanktarget() {
        return ranktarget;
    }

    public void setRanktarget(String ranktarget) {
        this.ranktarget = ranktarget;
    }

    public String getRankachieved() {
        return rankachieved;
    }

    public void setRankachieved(String rankachieved) {
        this.rankachieved = rankachieved;
    }

    public String getRankcategory() {
        return rankcategory;
    }

    public void setRankcategory(String rankcategory) {
        this.rankcategory = rankcategory;
    }

    public String getRankidate() {
        return rankidate;
    }

    public void setRankidate(String rankidate) {
        this.rankidate = rankidate;
    }

    public String getRankdate() {
        return rankdate;
    }

    public void setRankdate(String rankdate) {
        this.rankdate = rankdate;
    }

    public String getRankstaffname() {
        return rankstaffname;
    }

    public void setRankstaffname(String rankstaffname) {
        this.rankstaffname = rankstaffname;
    }

    public String getRankdepname() {
        return rankdepname;
    }

    public void setRankdepname(String rankdepname) {
        this.rankdepname = rankdepname;
    }

    public String getRankcomment() {
        return rankcomment;
    }

    public void setRankcomment(String rankcomment) {
        this.rankcomment = rankcomment;
    }

    public double getRankweightVal() {
        return rankweightVal;
    }

    public void setRankweightVal(double rankweightVal) {
        this.rankweightVal = rankweightVal;
    }

    public double getRankmidyratingVal() {
        return rankmidyratingVal;
    }

    public void setRankmidyratingVal(double rankmidyratingVal) {
        this.rankmidyratingVal = rankmidyratingVal;
    }

    public double getRankendyratingVal() {
        return rankendyratingVal;
    }

    public void setRankendyratingVal(double rankendyratingVal) {
        this.rankendyratingVal = rankendyratingVal;
    }

    public double getRankaverageannualscore() {
        return rankaverageannualscore;
    }

    public void setRankaverageannualscore(double rankaverageannualscore) {
        this.rankaverageannualscore = rankaverageannualscore;
    }

    public double getRanktotalpoint() {
        return ranktotalpoint;
    }

    public void setRanktotalpoint(double ranktotalpoint) {
        this.ranktotalpoint = ranktotalpoint;
    }

    public String getCatTest() {
        return CatTest;
    }

    public void setCatTest(String CatTest) {
        this.CatTest = CatTest;
    }

    public int getFgoal() {
        return fgoal;
    }

    public void setFgoal(int fgoal) {
        this.fgoal = fgoal;
    }

    public String getFdescription() {
        return fdescription;
    }

    public void setFdescription(String fdescription) {
        this.fdescription = fdescription;
    }

    public String getFtarget() {
        return ftarget;
    }

    public void setFtarget(String ftarget) {
        this.ftarget = ftarget;
    }

    public String getFachieved() {
        return fachieved;
    }

    public void setFachieved(String fachieved) {
        this.fachieved = fachieved;
    }

    public String getFcategory() {
        return fcategory;
    }

    public void setFcategory(String fcategory) {
        this.fcategory = fcategory;
    }

    public String getFidate() {
        return fidate;
    }

    public void setFidate(String fidate) {
        this.fidate = fidate;
    }

    public String getFstaffname() {
        return fstaffname;
    }

    public void setFstaffname(String fstaffname) {
        this.fstaffname = fstaffname;
    }

    public String getFdepname() {
        return fdepname;
    }

    public void setFdepname(String fdepname) {
        this.fdepname = fdepname;
    }

    public double getFweightVal() {
        return fweightVal;
    }

    public void setFweightVal(double fweightVal) {
        this.fweightVal = fweightVal;
    }

    public int getHrid() {
        return hrid;
    }

    public void setHrid(int hrid) {
        this.hrid = hrid;
    }

    public String getHruname() {
        return hruname;
    }

    public void setHruname(String hruname) {
        this.hruname = hruname;
    }

    public String getHrpass() {
        return hrpass;
    }

    public void setHrpass(String hrpass) {
        this.hrpass = hrpass;
    }

    public String getHrfname() {
        return hrfname;
    }

    public void setHrfname(String hrfname) {
        this.hrfname = hrfname;
    }

    public String getHrlname() {
        return hrlname;
    }

    public void setHrlname(String hrlname) {
        this.hrlname = hrlname;
    }

    public String getHrtel() {
        return hrtel;
    }

    public void setHrtel(String hrtel) {
        this.hrtel = hrtel;
    }

    public String getHremail() {
        return hremail;
    }

    public void setHremail(String hremail) {
        this.hremail = hremail;
    }

    public String getHrrole() {
        return hrrole;
    }

    public void setHrrole(String hrrole) {
        this.hrrole = hrrole;
    }

    public int getFeedid() {
        return feedid;
    }

    public void setFeedid(int feedid) {
        this.feedid = feedid;
    }

    public String getFeedstname() {
        return feedstname;
    }

    public void setFeedstname(String feedstname) {
        this.feedstname = feedstname;
    }

    public String getFeeddescription() {
        return feeddescription;
    }

    public void setFeeddescription(String feeddescription) {
        this.feeddescription = feeddescription;
    }

    public String getFeeddate() {
        return feeddate;
    }

    public void setFeeddate(String feeddate) {
        this.feeddate = feeddate;
    }

    public String getFeeddepname() {
        return feeddepname;
    }

    public void setFeeddepname(String feeddepname) {
        this.feeddepname = feeddepname;
    }
    
    

    static class staff extends user {

        public staff(String stuname, String stpass, String stfname, String stlname, String stposition, String stdepartmentname, String sttel, String stemail, String stroln) {

            this.stuname = stuname;
            this.stpass = stpass;
            this.stfname = stfname;
            this.stlname = stlname;
            this.stposition = stposition;
            this.stdepartmentname = stdepartmentname;
            this.sttel = sttel;
            this.stemail = stemail;
            this.stroln = stroln;
        }

    }

    static class supervisor extends user {

        public supervisor(String suname, String spass, String sfname, String slname, String sposition, String stel, String semail, String sroln, String sdepartment) {

            this.suname = suname;
            this.spass = spass;
            this.sfname = sfname;
            this.slname = slname;
            this.sposition = sposition;
            this.stel = stel;
            this.semail = semail;
            this.sroln = sroln;
            this.sdepartment = sdepartment;
        }

    }

    static class admin extends user {

        public admin(String auname, String apass, String afirstname, String alastname, String aposition, String arole) {

            this.auname = auname;
            this.apass = apass;
            this.afirstname = afirstname;
            this.alastname = alastname;
            this.aposition = aposition;
            this.arole = arole;
        }

    }
    
    static class human extends user {

        public human(String hruname, String hrpass, String hrfname, String hrlname, String hrtel, String hremail, String hrrole) {

            this.hruname = hruname;
            this.hrpass = hrpass;
            this.hrfname = hrfname;
            this.hrlname = hrlname;
            this.hrtel = hrtel;
            this.hremail = hremail;
            this.hrrole = hrrole;
        }

    }

    static class department extends user {

        public department(String dpname) {

            this.dpname = dpname;

        }

    }

    static class position extends user {

        public position(String pname) {

            this.pname = pname;

        }

    }

    static class role extends user {

        public role(String rolename) {

            this.rolename = rolename;

        }

    }

    static class category extends user {

        public category(String catname) {

            this.catname = catname;

        }

    }

    public static class milestone extends user {

        public milestone(String description, String target, String category, String idate, String edate, int weight, String miledep) {

            this.description = description;
            this.target = target;
            this.category = category;
            this.idate = idate;
            this.edate = edate;
            this.weight = weight;
            this.miledep = miledep;

        }

    }

    public static class assignmile extends user {

        public assignmile(int assgoal, String assdescription, String asstarget, String asscategory, String assidate, String assedate, int assweight, String staffname, String assdepname) {

            this.assgoal = assgoal;
            this.assdescription = assdescription;
            this.asstarget = asstarget;
            this.asscategory = asscategory;
            this.assidate = assidate;
            this.assedate = assedate;
            this.assweight = assweight;
            this.staffname = staffname;
            this.assdepname = assdepname;

        }

    }

    public static class pendmile extends user {

        public pendmile(String penddescription, String pendtarget, String pendachieved, int pendweight, String pendcategory, String pendidate, String staffnamep, String penddepname) {

            this.penddescription = penddescription;
            this.pendtarget = pendtarget;
            this.pendachieved = pendachieved;
            this.pendweight = pendweight;
            this.pendcategory = pendcategory;
            this.pendidate = pendidate;
            this.staffnamep = staffnamep;
            this.penddepname = penddepname;

        }

    }

    public static class rankmile extends user {

        public rankmile(int rankgoal, String rankdescription, String ranktarget, String rankachieved, double rankweightVal, double rankmidyratingVal, double rankendyratingVal, double rankaverageannualscore, double ranktotalpoint, String rankcategory, String rankidate, String rankdate, String rankstaffname, String rankdepname, String rankcomment) {

            this.rankgoal = rankgoal;
            this.rankdescription = rankdescription;
            this.ranktarget = ranktarget;
            this.rankachieved = rankachieved;
            this.rankweightVal = rankweightVal;
            this.rankmidyratingVal = rankmidyratingVal;
            this.rankendyratingVal = rankendyratingVal;
            this.rankaverageannualscore = rankaverageannualscore;
            this.ranktotalpoint = ranktotalpoint;
            this.rankcategory = rankcategory;
            this.rankidate = rankidate;
            this.rankdate = rankdate;
            this.rankstaffname = rankstaffname;
            this.rankdepname = rankdepname;
            this.rankcomment = rankcomment;
            this.rankidate = rankidate;
            this.staffnamep = staffnamep;
            this.rankdepname = rankdepname;

        }

    }

    public static class fulfillmile extends user {

        public fulfillmile(int fgoal, String fdescription, String ftarget, String fachieved, double fweightVal, String fcategory, String fidate, String fstaffname, String fdepname) {

            this.fgoal = fgoal;
            this.fdescription = fdescription;
            this.ftarget = ftarget;
            this.fachieved = fachieved;
            this.fweightVal = fweightVal;
            this.fcategory = fcategory;
            this.fidate = fidate;
            this.fstaffname = fstaffname;
            this.fdepname = fdepname;

        }

    }

    public static class feedback extends user {

        public feedback(String feedstname, String feeddescription, String feeddate, String feeddepname) {
            
            this.feedstname = feedstname;
            this.feeddescription = feeddescription;
            this.feeddate = feeddate;
            this.feeddepname = feeddepname;

        }

    }

}
