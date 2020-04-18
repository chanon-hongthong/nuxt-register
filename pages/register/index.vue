<template>
    <div>
        <v-app-bar
        color="primary"
        dense
        flat
        dark
        >
        <v-toolbar-title>Register</v-toolbar-title>
        </v-app-bar>

        <v-container class="pt-0 pb-0">
            <v-row>
                <v-col cols="12">
                    <div class="mt8 text-primary text-title text-center">
                        Step 1 of 2
                    </div>
                </v-col>

                <v-col cols="12">
                    <div class="text-center pt-2 pb-0">
                        <img src="~/assets/icon/profile.png" alt="" width="155">
                    </div>
                </v-col>

                <v-col cols="12" class="pt-0 pb-0">
                    <div class="text-center">
                        Display name
                    </div>
                </v-col>

                <v-col cols="12" class="pt-0 pb-0">
                   <v-form ref="form">
                        <v-text-field
                            v-model="form.firstname"
                            label="Firstname"
                            required
                        ></v-text-field>
                        <v-text-field
                            v-model="form.lastname"
                            label="Lastname"
                            required
                        ></v-text-field>
                        <div class="gender-group d-flex mt-3">
                            <p>Gender</p>
                            <div class="circle" :class="form.gender == 1 ? 'active' : ''" @click="chooseGender(1)">
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	                                viewBox="0 0 351.778 351.778" style="enable-background:new 0 0 351.778 351.778;" xml:space="preserve">
                                    <path d="M321.778,95.024l30-0.049l-0.154-94.821L256.802,0l-0.049,30l43.741,0.071l-58.583,58.583
                                    c-26.385-21.595-59.13-33.339-93.68-33.339c-39.594,0-76.817,15.419-104.814,43.417C15.419,126.729,0,163.953,0,203.547
                                    s15.419,76.818,43.416,104.815s65.221,43.416,104.814,43.416s76.818-15.419,104.815-43.416
                                    c54.215-54.215,57.572-140.324,10.073-198.49l58.588-58.588L321.778,95.024z M231.833,287.149
                                    c-22.331,22.331-52.021,34.629-83.603,34.629S86.96,309.48,64.629,287.149C42.298,264.818,30,235.128,30,203.547
                                    s12.298-61.271,34.629-83.602s52.021-34.629,83.602-34.629c31.581,0,61.271,12.298,83.603,34.629
                                    C277.931,166.044,277.931,241.051,231.833,287.149z"/>
                                </svg>
                            </div>
                            <p>Male</p>

                            <div class="circle" :class="form.gender == 2 ? 'active' : ''" @click="chooseGender(2)">
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                    viewBox="0 0 414.693 414.693" style="enable-background:new 0 0 414.693 414.693;" xml:space="preserve">
                                    <path d="M355.578,148.231C355.578,66.496,289.082,0,207.347,0S59.115,66.496,59.115,148.231
                                    c0,76.672,58.514,139.933,133.231,147.476v47.601h-41.568v30h41.568v41.385h30v-41.385h41.568v-30h-41.568v-47.601
                                    C297.064,288.164,355.578,224.903,355.578,148.231z M89.115,148.231C89.115,83.038,142.153,30,207.347,30
                                    s118.231,53.038,118.231,118.231S272.54,266.462,207.347,266.462S89.115,213.424,89.115,148.231z"/>
                                </svg>
                            </div>                
                            <p>Female</p>

                        </div>

                        <v-btn rounded color="primary" dark class="w-100 mt-8 my-btn" @click="next">Next</v-btn>
                    </v-form>
                </v-col>

            </v-row>
        </v-container>
    
        
    </div>    
</template>
<script>
export default {
    data(){
        return{
            form:{
                firstname: this.$store.getters.getRegister.firstname,
                lastname: this.$store.getters.getRegister.lastname,
                gender: this.$store.getters.getRegister.gender
            }
        }
    },
    methods: {
        chooseGender(gender){
            this.form.gender = gender
        },
        validate(){
            let validated = true
            const errors = []
            let errorMsg = ''
            const validatorField = [
                'firstname',
                'lastname'
            ]
            validatorField.forEach((field => {
                if(this.form[field] == ''){
                    validated = false  
                    errors.push(`${field} can not be null` )
                }
            }))

            
            if(!validated){
                this.$store.dispatch('setDialog', {
                    isShow: true,
                    title: 'Form is error',
                    message: errors.map((error) => error + '<br/>').join('')
                })
            }
            
            return validated
        },
        next(){
            if(this.validate()){
                this.$store.dispatch('setRegister', this.form)
                this.$router.push('/register/step2')
            }  
        }
    }
}

</script>


<style lang="scss" scoped>
    .v-form{
        padding: 0 10px;
    }
    .gender-group{
        p{
            margin-bottom: 0;
            margin-right: 20px;
            align-self: center;
        }
        .circle{
            width: 45px;
            height: 45px;
            background: #1A56BE;
            color:#fff;
            border-radius: 50%;
            position:relative;
            background:rgba($color: #000000, $alpha: 0.3);
            margin-right: 7px;
            &.active{
                background: #1A56BE;
            }
            svg{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
            }
        }
    }
</style>