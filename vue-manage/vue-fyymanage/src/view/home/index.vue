<template>
  <el-row class="home" :gutter="20">
    <el-col :span="8" style="margin-top: 20px">
      <el-card>
        <div class="user">
          <img :src="userImg" title="头像" />
          <div class="userinfo">
            <p class="name">admin</p>
            <p class="accese">超级管理员</p>
          </div>
        </div>
        <div class="login-info">
          <p>
            登录实时时间：<span>{{ dateFormat(date) }}</span>
          </p>
          <p>登录实时地点：<span>上海</span></p>
        </div>
      </el-card>
      <el-card style="margin-top: 20px; height: 460px">
        <el-table :data="tableData">
          <el-table-column
            v-for="(val, key) in tableLabel"
            :key="key"
            :prop="key"
            :label="val"
          >
          </el-table-column>
        </el-table>
      </el-card>
    </el-col>
    <el-col style="margin-top: 20px" :span="16">
      <div class="num">
        <el-card
          v-for="item in countData"
          :key="item.name"
          :body-style="{ display: 'flex', padding: 0 }"
        >
          <i
            class="icon"
            :class="'el-icon-' + item.icon"
            :style="{ background: item.color }"
          ></i>
          <div class="detail">
            <p class="num">¥{{ item.value }}</p>
            <p class="txt">{{ item.name }}</p>
          </div>
        </el-card>
      </div>
      <el-card style="height: 280px">
        <div style="height: 280px" ref="echarts"></div>
      </el-card>
      <div class="graph">
        <el-card style="height: 260px">
          <div style="height: 240px" ref="userEcharts"></div>
        </el-card>
        <el-card style="height: 260px">
          <div style="height: 240px" ref="videoEcharts"></div
        ></el-card>
      </div>
    </el-col>
  </el-row>
</template>
<script>
import { getData } from "../../api/data.js";
import * as echarts from "echarts";
export default {
  name: "home",
  data() {
    return {
      date: new Date(),
      userImg: require("../../../src/assets/images/user.png"),
      tableData: [
        {
          name: "oppo",
          todayBuy: 100,
          monthBuy: 300,
          totalBuy: 800,
        },
        {
          name: "vivo",
          todayBuy: 100,
          monthBuy: 300,
          totalBuy: 800,
        },
        {
          name: "苹果",
          todayBuy: 100,
          monthBuy: 300,
          totalBuy: 800,
        },
        {
          name: "小米",
          todayBuy: 100,
          monthBuy: 300,
          totalBuy: 800,
        },
        {
          name: "三星",
          todayBuy: 100,
          monthBuy: 300,
          totalBuy: 800,
        },
        {
          name: "魅族",
          todayBuy: 100,
          monthBuy: 300,
          totalBuy: 800,
        },
      ],
      tableLabel: {
        name: "手机类型",
        todayBuy: "今日购买",
        monthBuy: "本月购买",
        totalBuy: "总购买",
      },
      countData: [
        {
          name: "今日支付订单",
          value: 1234,
          icon: "success",
          color: "#2ec7c9",
        },
        {
          name: "今日收藏订单",
          value: 210,
          icon: "star-on",
          color: "#ffb980",
        },
        {
          name: "今日未支付订单",
          value: 1234,
          icon: "s-goods",
          color: "#5ab1ef",
        },
        {
          name: "本月支付订单",
          value: 1234,
          icon: "success",
          color: "#2ec7c9",
        },
        {
          name: "本月收藏订单",
          value: 210,
          icon: "star-on",
          color: "#ffb980",
        },
        {
          name: "本月未支付订单",
          value: 1234,
          icon: "s-goods",
          color: "#5ab1ef",
        },
      ],
    };
  },
  methods: {
    dateFormat(time) {
      var date = new Date(time);
      var year = date.getFullYear();
      var month =
        date.getMonth() + 1 < 10
          ? "0" + (date.getMonth() + 1)
          : date.getMonth() + 1;
      var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
      var hours =
        date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
      var minutes =
        date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
      var seconds =
        date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
      // 拼接
      return (
        year +
        "-" +
        month +
        "-" +
        day +
        " " +
        hours +
        ":" +
        minutes +
        ":" +
        seconds
      );
    },
  },
  mounted() {
    //显示当前日期时间
    let _this = this; // 声明一个变量指向Vue实例this，保证作用域一致
    this.timer = setInterval(() => {
      _this.date = new Date(); // 修改数据date
    }, 1000);
    getData()
      .then((res) => {
        const { code, data } = res.data;
        if (code === 20000) {
          this.tableData = data.tableData;
          const order = data.orderData;
          const xData = order.date;
          const keyArray = Object.keys(order.data[0]);
          const series = [];
          keyArray.forEach((key) => {
            series.push({
              name: key,
              data: order.data.map((item) => item[key]),
              type: "line",
            });
          });
          const option = {
            xAxis: {
              data: xData,
            },
            yAxis: {},
            legend: {
              data: keyArray,
            },
            series,
          };
          const E = echarts.init(this.$refs.echarts);
          E.setOption(option);
          const userOption = {
            legend: {
              // 图例文字颜色
              textStyle: {
                color: "#333",
              },
            },
            grid: {
              left: "20%",
            },
            // 提示框
            tooltip: {
              trigger: "axis",
            },
            xAxis: {
              type: "category", // 类目轴
              data: data.userData.map((item) => item.date),
              axisLine: {
                lineStyle: {
                  color: "#17b3a3",
                },
              },
              axisLabel: {
                interval: 0,
                color: "#333",
              },
            },
            yAxis: [
              {
                type: "value",
                axisLine: {
                  lineStyle: {
                    color: "#17b3a3",
                  },
                },
              },
            ],
            color: ["#2ec7c9", "#b6a2de"],
            series: [
              {
                name: "新增用户",
                data: data.userData.map((item) => item.new),
                type: "bar",
              },
              {
                name: "活跃用户",
                data: data.userData.map((item) => item.active),
                type: "bar",
              },
            ],
          };
          const U = echarts.init(this.$refs.userEcharts);
          U.setOption(userOption);
          const videoOption = {
            tooltip: {
              trigger: "item",
            },
            color: [
              "#0f78f4",
              "#dd536b",
              "#9462e5",
              "#a6a6a6",
              "#e1bb22",
              "#39c362",
              "#3ed1cf",
            ],
            series: [{ data: data.videoData, type: "pie" }],
          };
          const V = echarts.init(this.$refs.videoEcharts);
          V.setOption(videoOption);
        }
        console.log(res);
      })
      .catch(function (error) {
        console.log(error);
      });
  },
  beforeDestroy() {
    if (this.timer) {
      clearInterval(this.timer); // 在Vue实例销毁前，清除我们的定时器
    }
  },
};
</script>