<template>
  <v-app>
    <nuxt></nuxt>
    <Dialog/>
  </v-app>
</template>

<script>
import Dialog from '~/components/Dialog'
export default {
  
  components:{
    Dialog
  }
}
</script>

<style lang="scss">
    .v-application{
      font-family: 'Quicksand', sans-serif;
    }
    .v-toolbar__title{
        text-align: center;
        width: 100%;
        font-weight: bold;
    }
    .v-application .primary{
      background-color: #1A56BE !important;
      border-color: #1A56BE !important;
    }
    .text-primary{
      color: #1A56BE;
    }
    .text-title{
      font-size: 20px;
      font-weight: bold;
    }
    .text-main{
      font-size: 20px;
    }
    .w-100{
      width:100%;
    }
    .my-btn{
      font-size:20px !important;
      text-transform: none !important;
      height: auto !important;
      padding: 12px 0 !important;
      font-weight: bold;
      &.outlined{
        border: 1px solid;
        border-radius: 28px;
        line-height: normal;
      }
    }
    .set-padding{
      padding: 0 10px;
    }
</style>