<template>
    <v-card class="mx-auto" :class="active == 1 ? 'active' : ''" max-width="400">
            
            <v-img
              class="white--text align-end"
              height="200px"
              src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
            >
              <div class="more-detail" v-if="active == 1" @click="$emit('moreDetail')">More Detail</div>
            </v-img>
            
            <div class="card-content">
              <div>
                <v-card-text class="text--primary">
                  <h1>{{ sessions.title }}</h1>
                </v-card-text>
                <v-card-subtitle class="pt-0">{{ sessions.spaker }}</v-card-subtitle>
              </div>

              <v-btn class="circle" @click="$emit('chooseWorkshop')">
                <v-icon>check</v-icon>
              </v-btn>
            </div>
          </v-card>
</template>

<style lang="scss" scoped>
.card-content {
  display: flex;
  justify-content: space-between;
  padding: 15px;
}
.circle {
  color: white;
  background-color: rgba($color: #1a56be, $alpha: 0.3) !important;
  height: 32px !important;
  width: 32px !important;
  min-width: auto !important;
  border-radius: 50px;
  align-self: center;
}
.more-detail {
  font-size: 12px;
  font-weight: bold;
  color: #1a56be;
  border-radius: 25px;
  padding: 10px 20px;
  background-color: white;
  display: inline;
  position: absolute;
  bottom: 11px;
  right: 11px;
}
.v-card__text {
  padding: 0px;
  padding-bottom: 5px;

  h1 {
    font-size: 24px;
  }
}
.v-card__subtitle {
  padding: 0px;
}

.v-card {
  .v-image {
    opacity: 0.4;
    filter: alpha(opacity=40); /* For IE8 and earlier */
  }
}
.v-card.active {
  .circle {
    background-color: rgba($color: #1a56be, $alpha: 1) !important;
  }
  .v-image {
    opacity: 1;
    filter: alpha(opacity=100); /* For IE8 and earlier */
  }
}
.v-card + .v-card {
  margin-top: 30px;
}
</style>

<script>
export default {
    props: ['active','sessions']
}
</script>