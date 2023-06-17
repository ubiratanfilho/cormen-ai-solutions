import React, { useState } from "react";
// import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { ReactDOM } from "react";
import "bootstrap/dist/css/bootstrap.min.css";


export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  // const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post("http://localhost:3000/login", {
        email,
        password,
      });

      // Mostra se usuario se logou ou deu algum erro.
      console.log("Usuário logado com sucesso!");
      console.log(response.data);
      // if (response.data == "Login success") {
      //   navigate("/products"); // Caso o usuário se logue será redirecionado para página de produtos
      // }
    } catch (error) {
      console.error("Erro ao logar usuario:", error); // Pode ser senha errada ou usuário não criado
    }
  };

  return (

<body class="d-flex align-items-center py-4">
  
<main class="form-signin w-25 m-auto">
  <form>
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
    <input
                    type="email"
                    className="form-control"
                    placeholder="Digite o Email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                  />
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
    <input
                    type="password"
                    className="form-control"
                    placeholder="Digite a senha"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                  />
      <label for="floatingPassword">Password</label>
    </div>

    <div class="form-check text-start my-3">
    <input
                    type="checkbox"
                    className="checkbox"
                    
                  />
      <label class="form-check-label" for="flexCheckDefault">
        Remember me
      </label>
    </div>
    <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-body-secondary">© 2017–2023</p>
  </form>
</main>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    

</body>
);
}
