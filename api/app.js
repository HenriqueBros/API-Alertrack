
const fetchApi = () => {
    const getApiUrl =  id => `https://alertrack.com.br/dev/rest_api/tester/${id}`


    const ApiPromises = []

    for(let i = 1; i <= 3; i++) {
        ApiPromises.push(fetch(getApiUrl(i)).then(response => response.json()))   
    }

    Promise.all(ApiPromises)
        .then(Api => {
          //  console.log(lisApi)

            const lisApi = Api.reduce((accumulator, Api) => {
                accumulator += `
                <li class="card">${Api.cpf}</li>
                    <h2 class="card-title">${Api.companies}. ${Api.name}</h2>
                    
                </li>
            
                `


                return accumulator
            }, '')

            //console.log(lisApi)

            const ul = document.querySelector('[data-js="pokedex"]')

            ul.innerHTML = lisApi
        })
}

fetchApi()