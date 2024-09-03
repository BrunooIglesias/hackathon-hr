import { InferGetServerSidePropsType } from "next";
import Router from "next/router";

import Button from "@/components/Button";

export default function Home({
  events,
}: InferGetServerSidePropsType<typeof getServerSideProps>) {
  function parseDate(dateStr: string): Date {
    const [day, month, year] = dateStr.split("-");
    return new Date(`${year}-${month}-${day}`);
  }

  const orderedEvents = events.sort((a, b) => {
    const dateA = new Date(a.start_date);
    const dateB = new Date(b.start_date);
    return dateA.getTime() - dateB.getTime();
  });

  let lastDisplayedDate: string = "";

  const showDate = (date: string) => {
    if (lastDisplayedDate !== date) {
      lastDisplayedDate = date;
      return <h2 className="font-bold text-3xl text-center mb-2">{date}</h2>;
    }

    return false;
  };

  return (
    <>
      <span className="flex justify-center">
        <Button onClick={() => Router.push("/add-event")}>+ New Event</Button>
      </span>
      <div className="w-full items-center  mt-8 flex flex-col gap-8 h-screen overflow-scroll">
        {orderedEvents.map((event: any) => (
          <div key={event.id} className="w-1/3">
            {showDate(event.start_date)}
            <div className="bg-gray-600 border border-gray-500 p-8 rounded-xl w-full text-center">
              <h3 className="text-white text-2xl font-bold">{event.title}</h3>
            </div>
          </div>
        ))}
      </div>
    </>
  );
}

export async function getServerSideProps(context) {
  const apiUrl = process.env.NEXT_PUBLIC_API_URL;

  const token = context.req.cookies.token || "";

  const response = await fetch(`${apiUrl}/events`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      authorization: token,
    },
  });

  if (!response.ok) {
    return {
      props: {
        events: [],
      },
    };
  }

  const events = await response.json();

  return {
    props: {
      events,
    },
  };
}
