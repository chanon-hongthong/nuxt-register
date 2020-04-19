<template>
    <div>
        <v-app-bar color="primary" dense flat dark>
        <v-toolbar-title>WorkShop</v-toolbar-title>
        </v-app-bar>

        <v-container class="pt-0 pb-0">
            <v-row>
                <v-col cols="12" class="pt-0 pb-0">
                    <div class="mt-3 text-primary text-title text-center">
                        20 April 2020
                    </div>
                </v-col>
            </v-row>

            <v-row>
                <v-col cols="12">
                    <v-card
                        class="mx-auto active"
                        max-width="400"
                    >
                        <v-img
                        class="white--text align-end"
                        height="200px"
                        src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
                        >
                        <div class="more-detail">More Detail</div>
                        </v-img>

                        <div class="card-content">
                            <div>
                                <v-card-text class="text--primary">
                                    <h1>Design Thinking 1</h1>
                                </v-card-text>
                                <v-card-subtitle class="pt-0">Subject 1</v-card-subtitle>
                            </div>

                            <v-btn class="circle">
                                <v-icon>check</v-icon>
                            </v-btn>
                        </div>

                    </v-card>

                    <v-card
                        class="mx-auto"
                        max-width="400"
                    >
                        <v-img
                        class="white--text align-end"
                        height="200px"
                        src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
                        >
                        <div class="more-detail">More Detail</div>
                        </v-img>

                        <div class="card-content">
                            <div>
                                <v-card-text class="text--primary">
                                    <h1>Design Thinking 2</h1>
                                </v-card-text>
                                <v-card-subtitle class="pt-0">Subject 2</v-card-subtitle>
                            </div>

                            <v-btn class="circle">
                                <v-icon>check</v-icon>
                            </v-btn>
                        </div>

                    </v-card>

                </v-col>

                <v-col cols="12">
                    <v-btn rounded color="primary" dark class="w-100 my-btn" @click="next">Next</v-btn>
                </v-col>

            </v-row>
        </v-container>
    </div>
</template>

<style lang="scss" scoped>
    .card-content{
        display: flex;
        justify-content: space-between;
        padding: 15px;
    }
    .circle{
        color: white;
        background-color: rgba($color: #1A56BE, $alpha: 0.3) !important;
        height: 32px !important;
        width: 32px !important;
        min-width: auto !important;
        border-radius: 50px;
        align-self: center;
    }
    .more-detail{
        font-size: 12px;
        font-weight: bold;
        color: #1A56BE;
        border-radius: 25px;
        padding: 10px 20px;
        background-color: white;
        display: inline;
        position: absolute;
        bottom: 11px;
        right: 11px;
    }
    .v-card__text{
        padding: 0px;
        padding-bottom: 5px;

        h1{
            font-size: 24px;
        }
    }
    .v-card__subtitle{
        padding: 0px;
    }
    .v-card{
        .v-image{
            opacity: 0.4;
            filter: alpha(opacity=40); /* For IE8 and earlier */
        }
    }
    .v-card.active{
        .circle{
            background-color: rgba($color: #1A56BE, $alpha: 1) !important;
        }
        .v-image{
            opacity: 1;
            filter: alpha(opacity=100); /* For IE8 and earlier */
        }
    }
    .v-card+.v-card{
        margin-top: 30px
    }
</style>

<script>
export default {
    methods:{
        next(){
            this.$router.push('/workshop/more')
        }
    }
}
</script>