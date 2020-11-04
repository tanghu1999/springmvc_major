package com.th.entity;


import java.util.List;

public class TreeOne {
    private Integer id;
    private String title;
    private List<TreeOne> children;

    public TreeOne(){}
    public TreeOne(String title, List<TreeOne> children) {
        this.title = title;
        this.children = children;
    }

    public TreeOne(Integer id, String title, List<TreeOne> children) {
        this.id = id;
        this.title = title;
        this.children = children;
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

    public List<TreeOne> getChildren() {
        return children;
    }

    public void setChildren(List<TreeOne> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "TreeOne{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", children=" + children +
                '}';
    }
}
