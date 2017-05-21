package com.njl.bean;

import java.util.ArrayList;
import java.util.List;

public class UsedPicExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UsedPicExample() {
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

        public Criteria andUpicidIsNull() {
            addCriterion("upicid is null");
            return (Criteria) this;
        }

        public Criteria andUpicidIsNotNull() {
            addCriterion("upicid is not null");
            return (Criteria) this;
        }

        public Criteria andUpicidEqualTo(Integer value) {
            addCriterion("upicid =", value, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidNotEqualTo(Integer value) {
            addCriterion("upicid <>", value, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidGreaterThan(Integer value) {
            addCriterion("upicid >", value, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidGreaterThanOrEqualTo(Integer value) {
            addCriterion("upicid >=", value, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidLessThan(Integer value) {
            addCriterion("upicid <", value, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidLessThanOrEqualTo(Integer value) {
            addCriterion("upicid <=", value, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidIn(List<Integer> values) {
            addCriterion("upicid in", values, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidNotIn(List<Integer> values) {
            addCriterion("upicid not in", values, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidBetween(Integer value1, Integer value2) {
            addCriterion("upicid between", value1, value2, "upicid");
            return (Criteria) this;
        }

        public Criteria andUpicidNotBetween(Integer value1, Integer value2) {
            addCriterion("upicid not between", value1, value2, "upicid");
            return (Criteria) this;
        }

        public Criteria andUsedidIsNull() {
            addCriterion("usedid is null");
            return (Criteria) this;
        }

        public Criteria andUsedidIsNotNull() {
            addCriterion("usedid is not null");
            return (Criteria) this;
        }

        public Criteria andUsedidEqualTo(Integer value) {
            addCriterion("usedid =", value, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidNotEqualTo(Integer value) {
            addCriterion("usedid <>", value, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidGreaterThan(Integer value) {
            addCriterion("usedid >", value, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidGreaterThanOrEqualTo(Integer value) {
            addCriterion("usedid >=", value, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidLessThan(Integer value) {
            addCriterion("usedid <", value, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidLessThanOrEqualTo(Integer value) {
            addCriterion("usedid <=", value, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidIn(List<Integer> values) {
            addCriterion("usedid in", values, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidNotIn(List<Integer> values) {
            addCriterion("usedid not in", values, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidBetween(Integer value1, Integer value2) {
            addCriterion("usedid between", value1, value2, "usedid");
            return (Criteria) this;
        }

        public Criteria andUsedidNotBetween(Integer value1, Integer value2) {
            addCriterion("usedid not between", value1, value2, "usedid");
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