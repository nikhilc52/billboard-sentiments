/* SPDX-FileCopyrightText: 2014-present Kriasoft */
/* SPDX-License-Identifier: MIT */

import { Container, Typography } from "@mui/joy";
import { usePageEffect } from "../core/page";

export const Component = function OurData(): JSX.Element {
  usePageEffect({ title: "Our Data" });

  return (
    <Container sx={{ py: 2 }}>
      <Typography level="h2" gutterBottom>
        Our Data
      </Typography>
      <Typography>Coming soon...</Typography>
    </Container>
  );
};
