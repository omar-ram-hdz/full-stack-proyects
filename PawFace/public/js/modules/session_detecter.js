export default function detectSession(key, to) {
  if (!localStorage.getItem(key)) {
    location.href = `/${to}`;
  } else console.log("Session exist");
}
