import { setCookie } from "@/utils/manageCookies";

function login() {
  const apiUrl = process.env.NEXT_PUBLIC_API_URL;

  return async () => {
    const email = document.getElementById("email") as HTMLInputElement;
    const password = document.getElementById("password") as HTMLInputElement;

    const response = await fetch(`${apiUrl}/auth/sign_in`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email: email.value,
        password: password.value,
      }),
    });

    if (response.ok) {
      // const headers = response.headers;
      // const token = headers.get("authorization");
      // TODO: Use actual token
      const token =
        "Bearer eyJhY2Nlc3MtdG9rZW4iOiIyZ09HMGVPLUJtNXVXb2dDUDVGcXR3IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InE0ZUhJUnh6NU9HVUw2NDkteGRWOEEiLCJleHBpcnkiOiIxNzI1OTE0NDM3IiwidWlkIjoiYnJ1bm9Ac2lsdmVyLXJpdmVyLnVzIn0=";
      if (token) {
        setCookie("token", token);
        window.location.href = "/";
      } else {
        alert("No token found");
      }
    } else {
      alert("Invalid email or password");
    }
  };
}

export default function Login() {
  return (
    <div className="flex items-center justify-center h-full">
      <div className="flex flex-col items-center justify-center px-6 py-8 w-1/3">
        <div className="w-full rounded-lg shadow-lg bg-gray-800">
          <div className="p-8 space-y-6">
            <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
              Log in
            </h1>
            <div className="space-y-6">
              <div>
                <label className="block mb-2 text-sm font-medium text-white">
                  Your email
                </label>
                <input
                  type="email"
                  name="email"
                  id="email"
                  className="text-sm rounded-lg block w-full p-2.5 bg-gray-700 border-gray-600 text-white"
                />
              </div>
              <div>
                <label className="block mb-2 text-sm font-medium text-white">
                  Password
                </label>
                <input
                  type="password"
                  name="password"
                  id="password"
                  className="text-sm rounded-lg block w-full p-2.5 bg-gray-700 border-gray-600 text-white mb-10"
                />
              </div>
              <button
                onClick={login()}
                className="w-full text-white bg-gray-700 hover:bg-gray-600 font-medium rounded-lg text-sm px-5 py-2.5 text-center cursor-pointer duration-200"
              >
                Submit
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
