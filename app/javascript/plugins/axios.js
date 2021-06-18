import axios from 'axios'
import { csrfToken } from 'rails-ujs';

const axiosInstance = axios.create({
  baseURL: 'api',
  headers: {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    "X-CSRF-Token": csrfToken()
  },
  responseType: 'json'  
})

export default axiosInstance