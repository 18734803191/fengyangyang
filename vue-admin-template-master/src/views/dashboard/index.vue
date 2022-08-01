<template>
  <div>
    <card></card>
	<sale></sale>
	<observer></observer>
  </div>
</template>

<script>
import card from './card.vue'
import sale from './sale.vue'
import observer from './observer.vue'
export default {

  name: 'Dashboard',
	components:{
		card,
		sale,
		observer
	}
}
</script>

<style lang="scss" scoped>
	
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
</style>
