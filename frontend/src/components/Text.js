import React , { Component } from 'react'
import axios from 'axios'

class Text extends Component {
    constructor(props) {
        super(props)

        this.state = {
            text: ''
        }
    }

    componentDidMount() {
        axios.get('http://localhost:8080/get')
            .then(response => {
                console.log(response)
                this.setState({text: response.data})
            })
            .catch(error => {
                console.log(error)
            })
    }

    render() {
        return <p> { this.state.text } </p>
    }
}

export default Text;