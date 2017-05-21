package com.njl.bean;

import java.util.ArrayList;
import java.util.List;

public class BlogPicExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BlogPicExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andBpicidIsNull() {
            addCriterion("bpicid is null");
            return (Criteria) this;
        }

        public Criteria andBpicidIsNotNull() {
            addCriterion("bpicid is not null");
            return (Criteria) this;
        }

        public Criteria andBpicidEqualTo(Integer value) {
            addCriterion("bpicid =", value, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidNotEqualTo(Integer value) {
            addCriterion("bpicid <>", value, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidGreaterThan(Integer value) {
            addCriterion("bpicid >", value, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidGreaterThanOrEqualTo(Integer value) {
            addCriterion("bpicid >=", value, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidLessThan(Integer value) {
            addCriterion("bpicid <", value, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidLessThanOrEqualTo(Integer value) {
            addCriterion("bpicid <=", value, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidIn(List<Integer> values) {
            addCriterion("bpicid in", values, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidNotIn(List<Integer> values) {
            addCriterion("bpicid not in", values, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidBetween(Integer value1, Integer value2) {
            addCriterion("bpicid between", value1, value2, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBpicidNotBetween(Integer value1, Integer value2) {
            addCriterion("bpicid not between", value1, value2, "bpicid");
            return (Criteria) this;
        }

        public Criteria andBlogidIsNull() {
            addCriterion("blogid is null");
            return (Criteria) this;
        }

        public Criteria andBlogidIsNotNull() {
            addCriterion("blogid is not null");
            return (Criteria) this;
        }

        public Criteria andBlogidEqualTo(Integer value) {
            addCriterion("blogid =", value, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidNotEqualTo(Integer value) {
            addCriterion("blogid <>", value, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidGreaterThan(Integer value) {
            addCriterion("blogid >", value, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidGreaterThanOrEqualTo(Integer value) {
            addCriterion("blogid >=", value, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidLessThan(Integer value) {
            addCriterion("blogid <", value, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidLessThanOrEqualTo(Integer value) {
            addCriterion("blogid <=", value, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidIn(List<Integer> values) {
            addCriterion("blogid in", values, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidNotIn(List<Integer> values) {
            addCriterion("blogid not in", values, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidBetween(Integer value1, Integer value2) {
            addCriterion("blogid between", value1, value2, "blogid");
            return (Criteria) this;
        }

        public Criteria andBlogidNotBetween(Integer value1, Integer value2) {
            addCriterion("blogid not between", value1, value2, "blogid");
            return (Criteria) this;
        }

        public Criteria andPictureurlIsNull() {
            addCriterion("pictureurl is null");
            return (Criteria) this;
        }

        public Criteria andPictureurlIsNotNull() {
            addCriterion("pictureurl is not null");
            return (Criteria) this;
        }

        public Criteria andPictureurlEqualTo(String value) {
            addCriterion("pictureurl =", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlNotEqualTo(String value) {
            addCriterion("pictureurl <>", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlGreaterThan(String value) {
            addCriterion("pictureurl >", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlGreaterThanOrEqualTo(String value) {
            addCriterion("pictureurl >=", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlLessThan(String value) {
            addCriterion("pictureurl <", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlLessThanOrEqualTo(String value) {
            addCriterion("pictureurl <=", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlLike(String value) {
            addCriterion("pictureurl like", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlNotLike(String value) {
            addCriterion("pictureurl not like", value, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlIn(List<String> values) {
            addCriterion("pictureurl in", values, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlNotIn(List<String> values) {
            addCriterion("pictureurl not in", values, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlBetween(String value1, String value2) {
            addCriterion("pictureurl between", value1, value2, "pictureurl");
            return (Criteria) this;
        }

        public Criteria andPictureurlNotBetween(String value1, String value2) {
            addCriterion("pictureurl not between", value1, value2, "pictureurl");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}