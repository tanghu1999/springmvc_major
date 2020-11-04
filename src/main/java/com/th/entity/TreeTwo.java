package com.th.entity;

public class TreeTwo {
    private Integer id;
    private String title;
    private Integer pid;

    public TreeTwo(){}
    public TreeTwo(String title, Integer pid) {
        this.title = title;
        this.pid = pid;
    }

    public TreeTwo(Integer id, String title, Integer pid) {
        this.id = id;
        this.title = title;
        this.pid = pid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "TreeTwo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", pid=" + pid +
                '}';
    }
}
