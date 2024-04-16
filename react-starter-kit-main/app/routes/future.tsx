import { Container, Typography } from "@mui/joy";
import { usePageEffect } from "../core/page";

export const Component = function Future(): JSX.Element {
  usePageEffect({ title: "Future Prospects" });

  return (
    <Container sx={{ py: 2 }}>
      <Typography level="h2" gutterBottom>
        Future Prospects
      </Typography>
      <Typography>Coming soon...</Typography>
    </Container>
  );
};
