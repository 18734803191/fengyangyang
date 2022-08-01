<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <router-link to="/">
      <el-button>按钮</el-button>
    </router-link>
    <router-link to="/user">
      <el-button type="primary">主要按钮</el-button>
    </router-link>
    <el-radio-group v-model="radio">
      <el-radio :label="3">备选项</el-radio>
      <el-radio :label="6">备选项</el-radio>
      <el-radio :label="9">备选项</el-radio>
    </el-radio-group>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      radio: 3,
    };
  },
  props: {
    msg: String,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
