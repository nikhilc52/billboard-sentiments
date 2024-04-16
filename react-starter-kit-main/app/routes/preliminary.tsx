/* SPDX-FileCopyrightText: 2014-present Kriasoft */
/* SPDX-License-Identifier: MIT */

import { Container, Typography } from "@mui/joy";
import { usePageEffect } from "../core/page";

export const Component = function Preliminary(): JSX.Element {
  usePageEffect({ title: "Preliminary Research" });

  return (
    <Container sx={{ py: 2 }}>
      <Typography level="h2" gutterBottom>
        Preliminary Research
      </Typography>
      <Typography>Coming soon...</Typography>
    </Container>
  );
};
