export default function Button({ onClick, children }: { onClick: () => void; children: React.ReactNode }) {
  return (
    <button
      onClick={onClick}
      className="w-1/3 rounded-xl text-3xl font-bold bg-green-400 p-8 my-6 cursor-pointer"
    >
      {children}
    </button>
  );
}