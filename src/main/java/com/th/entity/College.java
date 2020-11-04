package com.th.entity;

public class College {
    private Integer cid;
    private String cname;
    private String caddress;
    private String createtime;
    private String cpic;
    public College(){}
    public College(String cname, String caddress, String createtime, String cpic) {
        this.cname = cname;
        this.caddress = caddress;
        this.createtime = createtime;
        this.cpic = cpic;
    }

    public College(Integer cid, String cname, String caddress, String createtime, String cpic) {
        this.cid = cid;
        this.cname = cname;
        this.caddress = caddress;
        this.createtime = createtime;
        this.cpic = cpic;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getCpic() {
        return cpic;
    }

    public void setCpic(String cpic) {
        this.cpic = cpic;
    }

    @Override
    public String toString() {
        return "College{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", caddress='" + caddress + '\'' +
                ", createtime='" + createtime + '\'' +
                ", cpic='" + cpic + '\'' +
                '}';
    }
}
