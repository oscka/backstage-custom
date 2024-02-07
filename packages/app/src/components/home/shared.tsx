import { TemplateBackstageLogoIcon } from '@backstage/plugin-home';
import { makeStyles } from '@material-ui/core/styles';
import React from 'react';

export const useLogoStyles = makeStyles(theme => ({
  container: {
    margin: theme.spacing(5, 0),
  },
  svg: {
    width: 'auto',
    height: 100,
  },
  path: {
    fill: '#7df3e1',
  },
}));

export const tools = [
  {
    url: 'https://backstage.io/docs',
    label: 'Docs',
    icon: <TemplateBackstageLogoIcon />,
  },
  {
    url: 'https://github.com/oscka/backstage-custom',
    label: 'GitHub',
    icon: <TemplateBackstageLogoIcon />,
  },
  {
    url: 'http://192.168.41.50:9000',
    label: 'SonarQube',
    icon: <TemplateBackstageLogoIcon />,
  },
  {
    url: 'https://nexus-oscka.openmsa.monster',
    label: 'nexus',
    icon: <TemplateBackstageLogoIcon />,
  },
  {
    url: 'https://argocd-oscka.openmsa.monster/',
    label: 'argocd',
    icon: <TemplateBackstageLogoIcon />,
  },
];
