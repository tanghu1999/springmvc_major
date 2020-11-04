package com.th.entity;

public class Emp {
    private Integer empno;
    private String ename;
    private Double salary;
    private Integer mgr;
    private Integer deptid;

    public Emp(){}
    public Emp(String ename, Double salary, Integer mgr, Integer deptid) {
        this.ename = ename;
        this.salary = salary;
        this.mgr = mgr;
        this.deptid = deptid;
    }

    public Emp(Integer empno, String ename, Double salary, Integer mgr, Integer deptid) {
        this.empno = empno;
        this.ename = ename;
        this.salary = salary;
        this.mgr = mgr;
        this.deptid = deptid;
    }

    public Integer getEmpno() {
        return empno;
    }

    public void setEmpno(Integer empno) {
        this.empno = empno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Integer getMgr() {
        return mgr;
    }

    public void setMgr(Integer mgr) {
        this.mgr = mgr;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empno=" + empno +
                ", ename='" + ename + '\'' +
                ", salary=" + salary +
                ", mgr=" + mgr +
                ", deptid=" + deptid +
                '}';
    }
}
