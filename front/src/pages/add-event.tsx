import Router from "next/router";

export default function AddEvent() {
  async function handleSubmit() {
    const title = document.getElementById("title") as HTMLInputElement;
    const startingDate = document.getElementById(
      "startingDate"
    ) as HTMLInputElement;
    const endingDate = document.getElementById(
      "endingDate"
    ) as HTMLInputElement;
    const userId = 2; // TODO: Get the actual user id

    const apiUrl = process.env.NEXT_PUBLIC_API_URL;

    const token = localStorage.getItem("token");

    const response = await fetch(`${apiUrl}/events`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        authorization: token || "",
      },
      body: JSON.stringify({
        title: title.value,
        start_date: startingDate.value,
        end_date: endingDate.value,
        user_id: userId,
      }),
    });

    if (response.ok) {
      Router.push("/");
    } else {
        alert("Something went wrong");
    }
  }

  return (
    <div className="flex items-center justify-center h-full">
      <div className="flex flex-col items-center justify-center px-6 py-8 w-1/3">
        <div className="w-full rounded-lg shadow-lg bg-gray-800">
          <div className="p-8 space-y-6">
            <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
              Add a new event
            </h1>
            <div className="space-y-6">
              <div>
                <label className="block mb-2 text-sm font-medium text-white">
                  Title
                </label>
                <input
                  type="text"
                  name="title"
                  id="title"
                  className="text-sm rounded-lg block w-full p-2.5 bg-gray-700 border-gray-600 text-white"
                />
              </div>
              <div>
                <label className="block mb-2 text-sm font-medium text-white">
                  Starting date
                </label>
                <input
                  type="date"
                  name="startingDate"
                  id="startingDate"
                  className="text-sm rounded-lg block w-full p-2.5 bg-gray-700 border-gray-600 text-white"
                />
              </div>
              <div>
                <label className="block mb-2 text-sm font-medium text-white">
                  Ending date
                </label>
                <input
                  type="date"
                  name="endingDate"
                  id="endingDate"
                  className="text-sm rounded-lg block w-full p-2.5 bg-gray-700 border-gray-600 text-white mb-10"
                />
              </div>
              <button
                onClick={handleSubmit}
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
