Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ED3C624D0
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 08:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727B510E43C;
	Wed,  2 Sep 2026 08:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMQKQX+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA7E10E43C
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788339112; x=1819875112;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=/wHZ8qDLCuVZgBLGH83viLzbU89kgcwsQAH8BOi343c=;
 b=eMQKQX+SSoF44p4i+n6PL57RM47lXIWwrzFup49aMayqxVh6ZqhBslyV
 Cyc09+0zEbNoctlf93vAT0Ry+iv0IjPB9zTW9rDlnS1/5a5ApmzqdAMqP
 Xeu4NZr78IsdKTNxdlFHCvunhpnNvB6r9pocYgYltqSPQ6nEDhJwzc12/
 gAA/LIHFMSQG7+dRUla/RA196Gq724qXtNkbKQDnqkwvxa5/1pbtvpQyn
 8CvFaoqsYIgLBrhku64xI8Iu3xhjfn52QqmJ6jVncAgNUfW+zRi9fSgUU
 ki/jay9LhIbxJ4aysSQVY6LzaprFiXOF9FioAHPGTLce3ZEyMQ7bytQtc w==;
X-CSE-ConnectionGUID: MdVo+LBaQNaqy/QZsISnMQ==
X-CSE-MsgGUID: pYxAymDkT+eGjwyDFOEQ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87927769"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208,217";a="87927769"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:51:52 -0700
X-CSE-ConnectionGUID: nvzwxB/rT126LtQC/SR1+Q==
X-CSE-MsgGUID: 5RXL7JJeRtWJahHAaGZnFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
 d="scan'208,217";a="292857475"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:51:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:51:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 01:51:51 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2G9hHpWCBGbtfhSYN+N0qgD0pzypL4RO53RhPe1+ECGQcZYCu3GYtQRXkD8GMgxWduwOrnY7Jrrg3/5++kSimK/GyGOE8EaBwTFudozfc5XeaZg2HdtBFn+CSMCAo1vUTgyyhklfVRf/+gtUNLE4pAiNOzhwnoKmWEVRALUWoNXt76uFesvtnTjYdaWUGjMsWafC//K8RfqJ1IGYP3r8duwndvUQp85/7I5OUtx+0i7uqseOq6Rnv41PWc1jSK9TZCBKiqQsbKocD1OBJbbvI0EMDSrCU0SqCfesYAtJBofRMBQrgTBOt60EWI//OAiN3E6icowp0WqogrG/dIvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGVA11Yya8tCplk+rgIyqZkicXTUEgGGR1y6uefqY00=;
 b=WnWFCwa5UMJvjB765gxWwigmsJyQXLa+ORmU7OQKeBhO/2ZbjbIcA5uTyI94/EODj/Qeyg9wfXYpl9o+MWIYMVtSfaXo3ctznc/TXbiaS7YIr34g6QjKEz82ps/JOV1O5hk+7CnwvxxyV7zIkgLjmnkQnEv6qFb7P7hKcR1fOAi0hHOLWq0bfii+mqSWQZsUwCY2Qy74StIZ0A0ltTghB34gPxvpM+hA9c55E1xGt8FdV4hmqOan6UQwRwPo9LzNWo6Fdf0UqODqmDLuNfCANb3T5HX3pWbtsCJJHxx4LjxcKmfb8eT6YDDC3gVNdikHJGaJVvdyUQskCP2CU2kEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5416.namprd11.prod.outlook.com (2603:10b6:208:319::22)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 08:51:46 +0000
Received: from BL1PR11MB5416.namprd11.prod.outlook.com
 ([fe80::3914:6d1b:c522:a887]) by BL1PR11MB5416.namprd11.prod.outlook.com
 ([fe80::3914:6d1b:c522:a887%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:51:46 +0000
From: "Xie, Xiaolu" <xiaolu.xie@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Deak,
 Imre" <imre.deak@intel.com>
Subject: Re: [PATCH v6] drm/i915/display: Enable VRR/HDR over MST
Thread-Topic: [PATCH v6] drm/i915/display: Enable VRR/HDR over MST
Thread-Index: AQHdOpn5g+mqQf264Eu9jJF2FZrKG7a692MAgAADRfs=
Date: Wed, 2 Sep 2026 08:51:46 +0000
Message-ID: <BL1PR11MB5416F9A30BC85077F0B10AA693B72@BL1PR11MB5416.namprd11.prod.outlook.com>
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
 <20260902051206.264215-1-xiaolu.xie@intel.com>
 <ee766f0b6e2b6f6a93e14229119e238c3c343987@intel.com>
In-Reply-To: <ee766f0b6e2b6f6a93e14229119e238c3c343987@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5416:EE_|CO1PR11MB5137:EE_
x-ms-office365-filtering-correlation-id: e43a14c9-9dca-4df4-06e7-08df08cf6b8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|3023799007|8096899003|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: h3lobtXa+TRvdyZH48KmSXQKQPSk9iZty5KtSQadY1kc0sgkG4Wz+S8ZtT/R7QBkDcviB93FT9K2TLmW8M2Sio7kpj5bEL7nLonLLyX2U0eeMfNdAH+QdnbNyT17XozWKk9g+fs8xug8QR6Mqv8obkDpAtLUunqX26hwCerKF89iUuLImwh82GFa66uPRkguqLKza8h+11WWI+YROfIDrA0UvupydLRac7/hbXh+REHOf7NZPF7VaNe+MVoXQd9X6fkMj0kxTPtewSCtlZ2XYsryxrpOPeRx42rJ8TzN/xn+ZMtOGxLTe2cA4SMRRKMDOZdjRG+cOuf/mbxmLY+qnfF2EwezrUMHKkfur/bE47vNUfIxn8z1XIhe2FUKh3J+WcVEkiKCiQufxEUCcoleUO2haubtPYy6sFhuFIuJqlWa8LkIjhTU5YXBNc5RUzMhrhL+K4AAtEGwuz2lCsdVyy2hgvaaEl3BGHII6D4jvY62b/zNwmLkoBQ89Yx2Ana8y+qxwdAz5HtJCUVgP41HNnIW+NLor992HELJuITfYq+xR7n3XUHnVcE3c0LpaoVLFSQBkfVBsrRJ/WR3cyURTbYT9vWI6qPDDaIsHI7ha8Obkpx8lqrYAtEGScyqxQ9CtJuBKkqPGCJubueuS2Ir1cuZcPEeovX5XxxZArKtfxraYhLH5CaqfqaR/3d2tFc8Ot5joZLaV1/s7tFM6PRF4v9Hyx/fygu1CufZCtn8/+E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5416.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(3023799007)(8096899003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vEqx10TOggWg5PVj5yyTnYLyXbZwK/2byPo9LQYIrbgsz8TeOpI3JxH+UD?=
 =?iso-8859-1?Q?MlpQu4PFqKy1t8GT9wTwJ5wk59ecmOmSljLaAjH5Xxchj8Wpq6hHIsCRy8?=
 =?iso-8859-1?Q?/ogCq1WIfLcrINKUszOpWGvJB4UP/qbqqxXIx/GohtwhYr3A98II2d+hP9?=
 =?iso-8859-1?Q?evtaEf8PnqIGBH9iuvNHV/ily8Uqlu6X+kz2hs2nsCO8lFVgT9ady6z3jm?=
 =?iso-8859-1?Q?I0TbSQttn9braoKGJjGSw+cog7ZBdp0Qvy7lcz+EMcGs9J58pM5yi2qCmL?=
 =?iso-8859-1?Q?JB0cDC7AEjATvDc/5UGhwymNlfUsl4BK6+OiDr1EEA/nqRsTq9gA/zYixL?=
 =?iso-8859-1?Q?BCK3mIALOO5j2K4L+uqIsoZlcHzj1Qp+aqGEaXaZBVSEK7+IKZhiafvCbN?=
 =?iso-8859-1?Q?kpwf0AJM2wIx8pprm9fuwdXgtaBcvmrRk6vhvo8fcodA7HPcRlv7F9lJj2?=
 =?iso-8859-1?Q?DS7Ypn59ENybqE5wI+6wKGjLlVd65YQzPCxMq27jxnvYDaKNdeO7w0FuEH?=
 =?iso-8859-1?Q?kZe4Hb0NIlYTLQCxFMq3w9oXOZE6JU2+LrGRrxdD3HeaO4/hNSsaosUi3u?=
 =?iso-8859-1?Q?qew5ANyPUhpIkkn7JJkPF7V/BPxZ+lgfGLJbr9upsge8MFyU/p5xG9rrOv?=
 =?iso-8859-1?Q?rC8Clvdo4jOABeDgtiRcKMfOJfYxqCEdMJUcv8IuwkKHriAR7eVSeZlVuk?=
 =?iso-8859-1?Q?fEllQXb5w8ewJNhfZ7iqTfsCzFpP2DXXOCVdByzwjFnCK/vYDB5yRRSURL?=
 =?iso-8859-1?Q?hx8jq3Lq7uDk6gQFmlaSH/rZURaB0RexTZb3+1pw0RHR418g2bOijeWqPP?=
 =?iso-8859-1?Q?1m7AjLoSN0JqIu3luN0WcmcmwB5oxuRXSUzDodKlPTfW9naPfLiHb7v6ML?=
 =?iso-8859-1?Q?N1JycwB42pkLgdA6V6UnoGeYJz1cFx6RJIH7RDz1BQM03HHif06cK5KWIK?=
 =?iso-8859-1?Q?aV5HWamwV3A2YzvhBkJn2pyjc7jUzrHEAp2AVcA1ACNEbP5eIHsWL1Al2d?=
 =?iso-8859-1?Q?msLK193lXnP6tahjiQd5af0O00zms394Fl8fOMCJNvjcnvCL9nwMyx3i4B?=
 =?iso-8859-1?Q?9hMTPPvWBYMyraoRIfpIkbMo6EkBxp5StcpFMXBpWAcy3lxAnr0R9v+vtT?=
 =?iso-8859-1?Q?Lp17U5Yh4YNx2lKK0Cv76RSVYcA1BS2EecaUos6utvgGKznKygVynve4XO?=
 =?iso-8859-1?Q?F44Oqk2Ssdm2eizXHjXk8iFkZV40gz+V2Yn87gPxiYf04zqWK/ijX++QVg?=
 =?iso-8859-1?Q?f1gD9Romkw5cnWYDzbWL0ASlQVBjGukzrCv09ye4aJuCvxyb+hK7PiM4NO?=
 =?iso-8859-1?Q?FaVL1Rx+mYBamZjCF0cKE2WAYqSJbiNtL35MAmnVOMOLjtCDObfRkZHnLw?=
 =?iso-8859-1?Q?rVT041gCSO+DqBCSVijKshcmtlOmxCr27GRbYASmCew/hhuQWRJ8KsleRP?=
 =?iso-8859-1?Q?TyR5b7/L7H4wKB3t3Meg0eL6TIGW69Uaust6M2wnYws6EWvxThR5zbHpUX?=
 =?iso-8859-1?Q?dAlh1qgfwsu7nUWcRridgKDsyEdiuz5Xj22PyDs4FRn0yat7OMase/a0XM?=
 =?iso-8859-1?Q?BwEkr3LxXX9XB/IIFofvE7Qh4YRLXd92cXjYUdfBXJmGLI2roN3nMlcVP6?=
 =?iso-8859-1?Q?KAOJ9Nt/JQO5EiyEt0r1K5t7v/pH1LQ6lK2RzDnFsNNbxiVqoPGmD/CRCU?=
 =?iso-8859-1?Q?qXEwjrmJGJ4YwMvS7ihOR8pMUwb/3lYQyQNsoPIGynyaQHKYl/XDc7zmes?=
 =?iso-8859-1?Q?xcGz10n4kgwCt8YVpzvBWG4346ygCr7msNDG48ArgCXtUJ?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR11MB5416F9A30BC85077F0B10AA693B72BL1PR11MB5416namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fZDDbGp58/gp6ddnJ3rO5mW4/OrHIS3lsVcSSDIiyocd320HaaGnYID0n/oVFbmTMgGv+4AvvtGbdQb6H45mcNGdkuB1bWzUR3BsFTDceBulsIB4RJPHdrie7QLx1TXdUepwZcBatGWxJbbqN6ZMrCIPAd266rXXsrooPxodxYniukD8enRUv3YKsLydRET0QZSACCZtJ5I3j5j3q57CBo7DYsSvbzVc7R8N4lILXQV3dL59RSsVkyXK4spJSBT6t7vdE+DWrVlP8ulpF/w6/E0qUNsbXw7ABP135JBF8MDIgn5darUxTjaEyOI2miu+Z8zQYZ1L//JJcsRd/bvurA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5416.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43a14c9-9dca-4df4-06e7-08df08cf6b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:51:46.5244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1pDLRZHXnvPOLWA72Iz89hprNP5tLWp8M3Xju8ej6DCh5AdR3kIu3wlLU++U0IC6ck7yjid8BYvjelhvYWQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--_000_BL1PR11MB5416F9A30BC85077F0B10AA693B72BL1PR11MB5416namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

Apologies for the rapid succession of versions. The repeated revisions were=
 primarily to address CI.Checkpatch formatting warnings and i915.CI.BAT WAR=
N_ON failures. The core logic of the patch has not changed. v6 is the final=
 version for this patch. Happy to wait for your review at your convenience.
Thank you for the feedback.

Best regards
________________________________
From: Jani Nikula <jani.nikula@linux.intel.com>
Sent: Wednesday, September 2, 2026 4:37 PM
To: Xie, Xiaolu <xiaolu.xie@intel.com>; intel-gfx@lists.freedesktop.org <in=
tel-gfx@lists.freedesktop.org>
Cc: ville.syrjala@linux.intel.com <ville.syrjala@linux.intel.com>; Deak, Im=
re <imre.deak@intel.com>; Xie, Xiaolu <xiaolu.xie@intel.com>
Subject: Re: [PATCH v6] drm/i915/display: Enable VRR/HDR over MST

On Wed, 02 Sep 2026, Xiao Lu <xiaolu.xie@intel.com> wrote:
> VRR over MST:
> - Remove the hard MST block in intel_vrr_is_capable(); check the
>   downstream port's MSA timing par ignore capability via REMOTE_DPCD_READ
>   and cache it in connector->dp.mst_msa_timing_par_ignore to avoid hot
>   path sideband round-trips.
> - Read mst_msa_timing_par_ignore unconditionally from the sink's virtual
>   DPCD before the DSC decompression check, so VRR works on MST sinks
>   without DSC support.
> - Attach vrr_capable property by reusing the root SST connector's existin=
g
>   property object (MST connectors are created post device-registration so
>   new properties cannot be created).
> - Update vrr_capable after EDID read; gate AS-SDP and
>   DP_MSA_TIMING_PAR_IGNORE_EN writes on pipe_config->vrr.enable
>   (actual state) not intel_vrr_is_capable() (capability); allow AS-SDP
>   through MST hubs by excluding only non-MST branch devices (PCONs)
>   from the branch device check.
> - Reuse colorspace property from root SST connector for MST connectors
>   to avoid WARN_ON from creating properties post device-registration.
>
> HDR metadata over MST:
> - Add VSC SDP, HDR metadata infoframe SDP and AS-SDP computation to
>   mst_stream_compute_config() and enable their transmission in
>   mst_stream_enable() and intel_ddi_update_pipe().
> - Lift the hard 8bpc pipe_bpp cap and use the bpp capability from sink
>   EDID for MST streams to allow 10bpc, relying on
>   intel_dp_mst_atomic_check_link()'s BW retry loop to fall back if the
>   link cannot fit it.

What changed between versions?

Please don't send a bunch of versions of a patch in quick succession.

Truth is, nobody's going to spend time looking at it, because they think
it's in a state of flux and it'll be wasted effort.


BR,
Jani.

>
> Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  3 +
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 36 ++++---
>  drivers/gpu/drm/i915/display/intel_dp.h       |  8 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 95 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vrr.c      | 15 ++-
>  7 files changed, 143 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 7ce9e212770a..174fa62cb0dc 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2164,6 +2164,7 @@ ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux=
,
>        return drm_dp_send_dpcd_read(port->mgr, port,
>                                     offset, size, buffer);
>  }
> +EXPORT_SYMBOL(drm_dp_mst_dpcd_read);
>
>  /**
>   * drm_dp_mst_dpcd_write() - write a series of bytes to the DPCD via sid=
eband
> @@ -2187,6 +2188,7 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *au=
x,
>        return drm_dp_send_dpcd_write(port->mgr, port,
>                                      offset, size, buffer);
>  }
> +EXPORT_SYMBOL(drm_dp_mst_dpcd_write);
>
>  static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t=
 *guid)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index b8985e1e0a81..f345d9a2154d 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3651,6 +3651,9 @@ void intel_ddi_update_pipe(struct intel_atomic_stat=
e *state,
>                intel_ddi_update_pipe_dp(state, encoder, crtc_state,
>                                         conn_state);
>
> +     if (intel_encoder_is_mst(encoder))
> +             intel_dp_set_infoframes(encoder, true, crtc_state, conn_sta=
te);
> +
>        if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
>                intel_ddi_update_pipe_hdmi(encoder, crtc_state,
>                                           conn_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index b7cc361fd955..d09cf18f5376 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -564,6 +564,7 @@ struct intel_connector {
>                u8 dsc_hblank_expansion_quirk:1;
>                u8 dsc_throughput_quirk:1;
>                u8 dsc_decompression_enabled:1;
> +             u8 mst_msa_timing_par_ignore:1; /* cached from MST virtual =
DPCD 0x007 */
>
>                struct {
>                        struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9..4b196d26d27f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2682,15 +2682,18 @@ intel_dp_compute_config_limits(struct intel_dp *i=
ntel_dp,
>
>        limits->pipe.min_bpp =3D intel_dp_min_bpp(crtc_state->output_forma=
t);
>        if (is_mst) {
> +             struct intel_connector *mst_connector =3D
> +                     to_intel_connector(conn_state->connector);
> +             int sink_bpc =3D mst_connector->base.display_info.bpc ?: 8;
> +
>                /*
> -              * FIXME: If all the streams can't fit into the link with t=
heir
> -              * current pipe_bpp we should reduce pipe_bpp across the bo=
ard
> -              * until things start to fit. Until then we limit to <=3D 8=
bpc
> -              * since that's what was hardcoded for all MST streams
> -              * previously. This hack should be removed once we have the
> -              * proper retry logic in place.
> +              * For MST streams, use the sink's EDID-reported color dept=
h
> +              * as the max bpp, rather than the pipe_bpp from a previous
> +              * modeset (which may be stale) or a hardcoded 8bpc cap.
> +              * The BW retry loop in intel_dp_mst_atomic_check_link() wi=
ll
> +              * reduce bpp if the aggregate link bandwidth is insufficie=
nt.
>                 */
> -             limits->pipe.max_bpp =3D min(crtc_state->max_pipe_bpp, 24);
> +             limits->pipe.max_bpp =3D sink_bpc * 3;
>        } else {
>                limits->pipe.max_bpp =3D intel_dp_max_bpp(intel_dp, crtc_s=
tate,
>                                                        respect_downstream=
_limits);
> @@ -3107,9 +3110,12 @@ static bool intel_dp_needs_as_sdp(struct intel_dp =
*intel_dp,
>                return false;
>
>        /*
> -      * #TODO: Add AS SDP v1 support for PCONs (DP branch devices).
> +      * AS-SDP is not yet supported for PCONs (DP-to-HDMI converters).
> +      * MST hubs are also branch devices but do support AS-SDP forwardin=
g
> +      * to downstream sinks; allow it for MST streams.
>         */
> -     if (drm_dp_is_branch(intel_dp->dpcd))
> +     if (drm_dp_is_branch(intel_dp->dpcd) &&
> +         !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST))
>                return false;
>
>        if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
> @@ -3119,8 +3125,8 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *=
intel_dp,
>        return intel_vrr_possible(crtc_state);
>  }
>
> -static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> -                                 struct intel_crtc_state *crtc_state)
> +void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> +                          struct intel_crtc_state *crtc_state)
>  {
>        struct drm_dp_as_sdp *as_sdp =3D &crtc_state->infoframes.as_sdp;
>        const struct drm_display_mode *adjusted_mode =3D
> @@ -3169,9 +3175,9 @@ static void intel_dp_compute_as_sdp(struct intel_dp=
 *intel_dp,
>                as_sdp->coasting_vtotal =3D crtc_state->vrr.vmax;
>  }
>
> -static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
> -                                  struct intel_crtc_state *crtc_state,
> -                                  const struct drm_connector_state *conn=
_state)
> +void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
> +                           struct intel_crtc_state *crtc_state,
> +                           const struct drm_connector_state *conn_state)
>  {
>        struct drm_dp_vsc_sdp *vsc;
>
> @@ -3228,7 +3234,7 @@ intel_dp_in_hdr_mode(const struct drm_connector_sta=
te *conn_state)
>        return hdr_metadata->hdmi_metadata_type1.eotf =3D=3D HDMI_EOTF_SMP=
TE_ST2084;
>  }
>
> -static void
> +void
>  intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
>                                            struct intel_crtc_state *crtc_=
state,
>                                            const struct drm_connector_sta=
te *conn_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i9=
15/display/intel_dp.h
> index 04fae203bb69..7887ba63c7a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -77,6 +77,8 @@ int intel_dp_compute_config(struct intel_atomic_state *=
state,
>                            struct intel_encoder *encoder,
>                            struct intel_crtc_state *pipe_config,
>                            struct drm_connector_state *conn_state);
> +void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> +                          struct intel_crtc_state *crtc_state);
>  bool intel_dp_needs_8b10b_fec(const struct intel_crtc_state *crtc_state,
>                              bool dsc_enabled_on_crtc);
>  void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state);
> @@ -130,6 +132,12 @@ bool intel_dp_joiner_needs_dsc(struct intel_display =
*display,
>  bool intel_dp_has_joiner(struct intel_dp *intel_dp);
>  bool intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state *crtc_=
state,
>                                    const struct drm_connector_state *conn=
_state);
> +void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
> +                           struct intel_crtc_state *crtc_state,
> +                           const struct drm_connector_state *conn_state)=
;
> +void intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_=
dp,
> +                                              struct intel_crtc_state *c=
rtc_state,
> +                                              const struct drm_connector=
_state *conn_state);
>  void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
>                             const struct intel_crtc_state *crtc_state,
>                             const struct drm_connector_state *conn_state)=
;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 3be1643f8d03..cbef63e94e2c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -793,6 +793,9 @@ static int mst_stream_compute_config(struct intel_ato=
mic_state *state,
>                        bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config-=
>lane_count);
>
>        intel_vrr_compute_config(pipe_config, conn_state);
> +     intel_dp_compute_as_sdp(intel_dp, pipe_config);
> +     intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
> +     intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, =
conn_state);
>
>        intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
>
> @@ -1157,6 +1160,24 @@ static void mst_stream_post_disable(struct intel_a=
tomic_state *state,
>         * Power down mst path before disabling the port, otherwise we end
>         * up getting interrupts from the sink upon detecting link loss.
>         */
> +     if (old_crtc_state->vrr.enable) {
> +             u8 val;
> +             ssize_t ret;
> +
> +             ret =3D drm_dp_mst_dpcd_read(&connector->mst.port->aux,
> +                                        DP_DOWNSPREAD_CTRL, &val, 1);
> +             if (ret < 0) {
> +                     drm_dbg_kms(display->drm,
> +                                 "[CONNECTOR:%d:%s] Failed to read DP_DO=
WNSPREAD_CTRL: %zd\n",
> +                                 connector->base.base.id,
> +                                 connector->base.name, ret);
> +             } else {
> +                     val &=3D ~DP_MSA_TIMING_PAR_IGNORE_EN;
> +                     drm_dp_mst_dpcd_write(&connector->mst.port->aux,
> +                                           DP_DOWNSPREAD_CTRL, &val, 1);
> +             }
> +     }
> +
>        drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.po=
rt,
>                                     false);
>
> @@ -1274,6 +1295,24 @@ static void mst_stream_pre_enable(struct intel_ato=
mic_state *state,
>
>        drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.po=
rt, true);
>
> +     if (pipe_config->vrr.enable) {
> +             u8 val;
> +             ssize_t ret;
> +
> +             ret =3D drm_dp_mst_dpcd_read(&connector->mst.port->aux,
> +                                        DP_DOWNSPREAD_CTRL, &val, 1);
> +             if (ret < 0) {
> +                     drm_dbg_kms(display->drm,
> +                                 "[CONNECTOR:%d:%s] Failed to read DP_DO=
WNSPREAD_CTRL: %zd\n",
> +                                 connector->base.base.id,
> +                                 connector->base.name, ret);
> +             } else {
> +                     val |=3D DP_MSA_TIMING_PAR_IGNORE_EN;
> +                     drm_dp_mst_dpcd_write(&connector->mst.port->aux,
> +                                           DP_DOWNSPREAD_CTRL, &val, 1);
> +             }
> +     }
> +
>        intel_dp_sink_enable_decompression(state, connector, pipe_config);
>
>        if (first_mst_stream) {
> @@ -1397,6 +1436,8 @@ static void mst_stream_enable(struct intel_atomic_s=
tate *state,
>
>        intel_enable_transcoder(pipe_config);
>
> +     intel_dp_set_infoframes(encoder, true, pipe_config, conn_state);
> +
>        for_each_pipe_crtc_modeset_enable(display, pipe_crtc, pipe_config)=
 {
>                const struct intel_crtc_state *pipe_crtc_state =3D
>                        intel_atomic_get_new_crtc_state(state, pipe_crtc);
> @@ -1451,6 +1492,15 @@ static int mst_connector_get_ddc_modes(struct drm_=
connector *_connector)
>
>        ret =3D intel_connector_update_modes(&connector->base, drm_edid);
>
> +     if (HAS_VRR(display)) {
> +             bool vrr_capable =3D intel_vrr_is_capable(connector);
> +
> +             drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %=
s\n",
> +                         connector->base.base.id, connector->base.name,
> +                         str_yes_no(vrr_capable));
> +             drm_connector_set_vrr_capable_property(&connector->base, vr=
r_capable);
> +     }
> +
>        drm_edid_free(drm_edid);
>
>        if (intel_dp_tunnel_uhbr_lanes_wa_setup(intel_dp)) {
> @@ -1735,6 +1785,22 @@ static int mst_topology_add_connector_properties(s=
truct intel_dp *intel_dp,
>
>        intel_attach_force_audio_property(&connector->base);
>        intel_attach_broadcast_rgb_property(&connector->base);
> +     /*
> +      * Reuse the colorspace property from the root SST connector.
> +      * MST connectors are created post device-registration so new
> +      * properties cannot be created here.
> +      */
> +     if (intel_dp->attached_connector &&
> +         intel_dp->attached_connector->base.colorspace_property) {
> +             connector->base.colorspace_property =3D
> +                     intel_dp->attached_connector->base.colorspace_prope=
rty;
> +             drm_object_attach_property(&connector->base.base,
> +                                        connector->base.colorspace_prope=
rty,
> +                                        DRM_MODE_COLORIMETRY_DEFAULT);
> +     }
> +
> +     if (intel_dp_has_gamut_metadata_dip(&dp_to_dig_port(intel_dp)->base=
))
> +             drm_connector_attach_hdr_output_metadata_property(&connecto=
r->base);
>
>        /*
>         * Reuse the prop from the SST connector because we're
> @@ -1745,6 +1811,23 @@ static int mst_topology_add_connector_properties(s=
truct intel_dp *intel_dp,
>        if (connector->base.max_bpc_property)
>                drm_connector_attach_max_bpc_property(&connector->base, 6,=
 12);
>
> +     /*
> +      * Reuse the vrr_capable property from the root intel_dp SST connec=
tor
> +      * which was created during driver load (before device registration=
).
> +      * MST connectors are created after device registration, so we cann=
ot
> +      * create new properties here - we must attach the existing one.
> +      * Also assign connector->vrr_capable_property so that
> +      * drm_connector_set_vrr_capable_property() can update the value.
> +      */
> +     if (HAS_VRR(display) && intel_dp->attached_connector &&
> +         intel_dp->attached_connector->base.vrr_capable_property) {
> +             connector->base.vrr_capable_property =3D
> +                     intel_dp->attached_connector->base.vrr_capable_prop=
erty;
> +             drm_object_attach_property(&connector->base.base,
> +                                        connector->base.vrr_capable_prop=
erty,
> +                                        0);
> +     }
> +
>        return drm_connector_set_path_property(&connector->base, pathprop)=
;
>  }
>
> @@ -1755,6 +1838,18 @@ intel_dp_mst_read_decompression_port_dsc_caps(stru=
ct intel_dp *intel_dp,
>        u8 dpcd_caps[DP_RECEIVER_CAP_SIZE];
>        struct drm_dp_desc desc;
>
> +     /*
> +      * Read MSA timing par ignore capability from the sink's virtual DP=
CD.
> +      * This is independent of DSC support so read it before the DSC che=
ck.
> +      */
> +     {
> +             u8 mst_dpcd[DP_RECEIVER_CAP_SIZE];
> +
> +             if (drm_dp_read_dpcd_caps(&connector->mst.port->aux, mst_dp=
cd) =3D=3D 0)
> +                     connector->dp.mst_msa_timing_par_ignore =3D
> +                             drm_dp_sink_can_do_video_without_timing_msa=
(mst_dpcd);
> +     }
> +
>        if (!connector->dp.dsc_decompression_aux)
>                return;
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 51e4f3309b8b..9737a19c1899 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -55,8 +55,19 @@ bool intel_vrr_is_capable(struct intel_connector *conn=
ector)
>                        return false;
>                fallthrough;
>        case DRM_MODE_CONNECTOR_DisplayPort:
> -             if (connector->mst.dp)
> -                     return false;
> +             if (connector->mst.dp) {
> +                     /*
> +                      * Use cached MSA timing ignore capability from the=
 DFP
> +                      * sink's virtual DPCD, set during connector init i=
n
> +                      * intel_dp_mst_read_decompression_port_dsc_caps().
> +                      * Avoid live sideband reads here as this function =
is
> +                      * called from the atomic check path.
> +                      */
> +                     if (!connector->dp.mst_msa_timing_par_ignore)
> +                             return false;
> +
> +                     break;
> +             }
>                intel_dp =3D intel_attached_dp(connector);
>                /*
>                 * Among non-MST DP branch devices, only an HDMI 2.1 sink =
connected

--
Jani Nikula, Intel

--_000_BL1PR11MB5416F9A30BC85077F0B10AA693B72BL1PR11MB5416namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
white-space: pre-wrap; margin-top: 0.1em; margin-bottom: 0.2em; font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Jani,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin-top: 0.1em; margin-bottom: 0.2em; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
white-space: pre-wrap; margin-top: 0.1em; margin-bottom: 0.2em; font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Apologies for the rapid succession of versions. The repeated revisions were=
 primarily to address CI.Checkpatch formatting warnings and i915.CI.BAT WAR=
N_ON failures. The core logic of the patch has not changed. v6 is the final=
 version for this patch. Happy to
 wait for your review at your convenience.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
white-space: pre-wrap; margin-top: 0.1em; margin-bottom: 0.2em; font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you for the feedback.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin-top: 0.1em; margin-bottom: 0.2em; font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
white-space: pre-wrap; margin-top: 0.1em; margin-bottom: 0.2em; font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best regards</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Jani Nikula &lt;jani.nikula@linux.intel.com&gt;<br>
<b>Sent:</b> Wednesday, September 2, 2026 4:37 PM<br>
<b>To:</b> Xie, Xiaolu &lt;xiaolu.xie@intel.com&gt;; intel-gfx@lists.freede=
sktop.org &lt;intel-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> ville.syrjala@linux.intel.com &lt;ville.syrjala@linux.intel.com&=
gt;; Deak, Imre &lt;imre.deak@intel.com&gt;; Xie, Xiaolu &lt;xiaolu.xie@int=
el.com&gt;<br>
<b>Subject:</b> Re: [PATCH v6] drm/i915/display: Enable VRR/HDR over MST</d=
iv>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Wed, 02 Sep 2026, Xiao Lu &lt;xiaolu.xie=
@intel.com&gt; wrote:<br>
&gt; VRR over MST:<br>
&gt; - Remove the hard MST block in intel_vrr_is_capable(); check the<br>
&gt;&nbsp;&nbsp; downstream port's MSA timing par ignore capability via REM=
OTE_DPCD_READ<br>
&gt;&nbsp;&nbsp; and cache it in connector-&gt;dp.mst_msa_timing_par_ignore=
 to avoid hot<br>
&gt;&nbsp;&nbsp; path sideband round-trips.<br>
&gt; - Read mst_msa_timing_par_ignore unconditionally from the sink's virtu=
al<br>
&gt;&nbsp;&nbsp; DPCD before the DSC decompression check, so VRR works on M=
ST sinks<br>
&gt;&nbsp;&nbsp; without DSC support.<br>
&gt; - Attach vrr_capable property by reusing the root SST connector's exis=
ting<br>
&gt;&nbsp;&nbsp; property object (MST connectors are created post device-re=
gistration so<br>
&gt;&nbsp;&nbsp; new properties cannot be created).<br>
&gt; - Update vrr_capable after EDID read; gate AS-SDP and<br>
&gt;&nbsp;&nbsp; DP_MSA_TIMING_PAR_IGNORE_EN writes on pipe_config-&gt;vrr.=
enable<br>
&gt;&nbsp;&nbsp; (actual state) not intel_vrr_is_capable() (capability); al=
low AS-SDP<br>
&gt;&nbsp;&nbsp; through MST hubs by excluding only non-MST branch devices =
(PCONs)<br>
&gt;&nbsp;&nbsp; from the branch device check.<br>
&gt; - Reuse colorspace property from root SST connector for MST connectors=
<br>
&gt;&nbsp;&nbsp; to avoid WARN_ON from creating properties post device-regi=
stration.<br>
&gt;<br>
&gt; HDR metadata over MST:<br>
&gt; - Add VSC SDP, HDR metadata infoframe SDP and AS-SDP computation to<br=
>
&gt;&nbsp;&nbsp; mst_stream_compute_config() and enable their transmission =
in<br>
&gt;&nbsp;&nbsp; mst_stream_enable() and intel_ddi_update_pipe().<br>
&gt; - Lift the hard 8bpc pipe_bpp cap and use the bpp capability from sink=
<br>
&gt;&nbsp;&nbsp; EDID for MST streams to allow 10bpc, relying on<br>
&gt;&nbsp;&nbsp; intel_dp_mst_atomic_check_link()'s BW retry loop to fall b=
ack if the<br>
&gt;&nbsp;&nbsp; link cannot fit it.<br>
<br>
What changed between versions?<br>
<br>
Please don't send a bunch of versions of a patch in quick succession.<br>
<br>
Truth is, nobody's going to spend time looking at it, because they think<br=
>
it's in a state of flux and it'll be wasted effort.<br>
<br>
<br>
BR,<br>
Jani.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Xiao Lu &lt;xiaolu.xie@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/display/drm_dp_mst_topology.c |&nbsp; 2 +<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_ddi.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 3 +<br>
&gt;&nbsp; .../drm/i915/display/intel_display_types.h&nbsp;&nbsp;&nbsp; |&n=
bsp; 1 +<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_dp.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 36 ++++---<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_dp.h&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 8 ++<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_dp_mst.c&nbsp;&nbsp; | 95 +++=
++++++++++++++++<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_vrr.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 15 ++-<br>
&gt;&nbsp; 7 files changed, 143 insertions(+), 17 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/g=
pu/drm/display/drm_dp_mst_topology.c<br>
&gt; index 7ce9e212770a..174fa62cb0dc 100644<br>
&gt; --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c<br>
&gt; +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c<br>
&gt; @@ -2164,6 +2164,7 @@ ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *=
aux,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return drm_dp_send_dpcd_read=
(port-&gt;mgr, port,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offs=
et, size, buffer);<br>
&gt;&nbsp; }<br>
&gt; +EXPORT_SYMBOL(drm_dp_mst_dpcd_read);<br>
&gt;&nbsp;<br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * drm_dp_mst_dpcd_write() - write a series of bytes to the=
 DPCD via sideband<br>
&gt; @@ -2187,6 +2188,7 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux =
*aux,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return drm_dp_send_dpcd_writ=
e(port-&gt;mgr, port,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; offset, size, buffer);<br>
&gt;&nbsp; }<br>
&gt; +EXPORT_SYMBOL(drm_dp_mst_dpcd_write);<br>
&gt;&nbsp;<br>
&gt;&nbsp; static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb=
, guid_t *guid)<br>
&gt;&nbsp; {<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/dr=
m/i915/display/intel_ddi.c<br>
&gt; index b8985e1e0a81..f345d9a2154d 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_ddi.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_ddi.c<br>
&gt; @@ -3651,6 +3651,9 @@ void intel_ddi_update_pipe(struct intel_atomic_s=
tate *state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; intel_ddi_update_pipe_dp(state, encoder, crtc_state,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; conn_state);<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (intel_encoder_is_mst(encoder))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (intel_crtc_has_type(crtc=
_state, INTEL_OUTPUT_HDMI))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; intel_ddi_update_pipe_hdmi(encoder, crtc_state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn_state);<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/driv=
ers/gpu/drm/i915/display/intel_display_types.h<br>
&gt; index b7cc361fd955..d09cf18f5376 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_display_types.h<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_display_types.h<br>
&gt; @@ -564,6 +564,7 @@ struct intel_connector {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u8 dsc_hblank_expansion_quirk:1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u8 dsc_throughput_quirk:1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u8 dsc_decompression_enabled:1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; u8 mst_msa_timing_par_ignore:1; /* cached from MST virtual DPCD 0x007 *=
/<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; struct {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct =
{<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c<br>
&gt; index 113d767e62e9..4b196d26d27f 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; @@ -2682,15 +2682,18 @@ intel_dp_compute_config_limits(struct intel_dp=
 *intel_dp,<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; limits-&gt;pipe.min_bpp =3D =
intel_dp_min_bpp(crtc_state-&gt;output_format);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_mst) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct intel_connector *mst_connector =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to_intel_connector(conn=
_state-&gt;connector);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int sink_bpc =3D mst_connector-&gt;base.display_info.bpc ?: 8;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * FIXME: If all the streams can't fit into the link with their<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * current pipe_bpp we should reduce pipe_bpp across the board<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * until things start to fit. Until then we limit to &lt;=3D 8bpc<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * since that's what was hardcoded for all MST streams<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * previously. This hack should be removed once we have the<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * proper retry logic in place.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * For MST streams, use the sink's EDID-reported color depth<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * as the max bpp, rather than the pipe_bpp from a previous<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * modeset (which may be stale) or a hardcoded 8bpc cap.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * The BW retry loop in intel_dp_mst_atomic_check_link() will<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * reduce bpp if the aggregate link bandwidth is insufficient.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; limits-&gt;pipe.max_bpp =3D min(crtc_state-&gt;max_pipe_bpp, 24);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; limits-&gt;pipe.max_bpp =3D sink_bpc * 3;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; limits-&gt;pipe.max_bpp =3D intel_dp_max_bpp(intel_dp, =
crtc_state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; respect_downstream_limits);<br>
&gt; @@ -3107,9 +3110,12 @@ static bool intel_dp_needs_as_sdp(struct intel_=
dp *intel_dp,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * #TODO: Add AS SDP v1 support for PCO=
Ns (DP branch devices).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * AS-SDP is not yet supported for PCON=
s (DP-to-HDMI converters).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * MST hubs are also branch devices but=
 do support AS-SDP forwarding<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to downstream sinks; allow it for MS=
T streams.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (drm_dp_is_branch(intel_dp-&gt;dpcd))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (drm_dp_is_branch(intel_dp-&gt;dpcd) &amp=
;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !intel_crtc_has_type=
(crtc_state, INTEL_OUTPUT_DP_MST))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (intel_psr_needs_alpm_aux=
_less(intel_dp, crtc_state) &amp;&amp;<br>
&gt; @@ -3119,8 +3125,8 @@ static bool intel_dp_needs_as_sdp(struct intel_d=
p *intel_dp,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return intel_vrr_possible(cr=
tc_state);<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct intel_crtc_state *c=
rtc_state)<br>
&gt; +void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; struct intel_crtc_state *crtc_state)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_as_sdp *as_sdp=
 =3D &amp;crtc_state-&gt;infoframes.as_sdp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_display_mod=
e *adjusted_mode =3D<br>
&gt; @@ -3169,9 +3175,9 @@ static void intel_dp_compute_as_sdp(struct intel=
_dp *intel_dp,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; as_sdp-&gt;coasting_vtotal =3D crtc_state-&gt;vrr.vmax;=
<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct intel_crtc_st=
ate *crtc_state,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_con=
nector_state *conn_state)<br>
&gt; +void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; struct intel_crtc_state *crtc_state,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; const struct drm_connector_state *conn_state)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_vsc_sdp *vsc;<=
br>
&gt;&nbsp;<br>
&gt; @@ -3228,7 +3234,7 @@ intel_dp_in_hdr_mode(const struct drm_connector_=
state *conn_state)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return hdr_metadata-&gt;hdmi=
_metadata_type1.eotf =3D=3D HDMI_EOTF_SMPTE_ST2084;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -static void<br>
&gt; +void<br>
&gt;&nbsp; intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *int=
el_dp,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct intel_crtc_state *crtc_state,<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_connector_state *con=
n_state)<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm=
/i915/display/intel_dp.h<br>
&gt; index 04fae203bb69..7887ba63c7a4 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.h<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp.h<br>
&gt; @@ -77,6 +77,8 @@ int intel_dp_compute_config(struct intel_atomic_stat=
e *state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct intel_encoder *encoder,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct intel_crtc_state *pipe_config,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct drm_connector_state *conn_state);<br>
&gt; +void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; struct intel_crtc_state *crtc_state);<br>
&gt;&nbsp; bool intel_dp_needs_8b10b_fec(const struct intel_crtc_state *crt=
c_state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; bool dsc_enabled_on_crtc);<br>
&gt;&nbsp; void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_sta=
te);<br>
&gt; @@ -130,6 +132,12 @@ bool intel_dp_joiner_needs_dsc(struct intel_displ=
ay *display,<br>
&gt;&nbsp; bool intel_dp_has_joiner(struct intel_dp *intel_dp);<br>
&gt;&nbsp; bool intel_dp_needs_vsc_colorimetry(const struct intel_crtc_stat=
e *crtc_state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const stru=
ct drm_connector_state *conn_state);<br>
&gt; +void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; struct intel_crtc_state *crtc_state,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; const struct drm_connector_state *conn_state);<br>
&gt; +void intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *int=
el_dp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct intel_crtc_state=
 *crtc_state,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct drm_connec=
tor_state *conn_state);<br>
&gt;&nbsp; void intel_dp_set_infoframes(struct intel_encoder *encoder, bool=
 enable,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; const struct intel_crtc_state *crtc_state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; const struct drm_connector_state *conn_state);<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu=
/drm/i915/display/intel_dp_mst.c<br>
&gt; index 3be1643f8d03..cbef63e94e2c 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c<br>
&gt; @@ -793,6 +793,9 @@ static int mst_stream_compute_config(struct intel_=
atomic_state *state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bxt_dpi=
o_phy_calc_lane_lat_optim_mask(pipe_config-&gt;lane_count);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_vrr_compute_config(pip=
e_config, conn_state);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intel_dp_compute_as_sdp(intel_dp, pipe_confi=
g);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intel_dp_compute_vsc_sdp(intel_dp, pipe_conf=
ig, conn_state);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intel_dp_compute_hdr_metadata_infoframe_sdp(=
intel_dp, pipe_config, conn_state);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp_audio_compute_confi=
g(encoder, pipe_config, conn_state);<br>
&gt;&nbsp;<br>
&gt; @@ -1157,6 +1160,24 @@ static void mst_stream_post_disable(struct inte=
l_atomic_state *state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Power down mst path =
before disabling the port, otherwise we end<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * up getting interrupt=
s from the sink upon detecting link loss.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (old_crtc_state-&gt;vrr.enable) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; u8 val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ssize_t ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D drm_dp_mst_dpcd_read(&amp;connector-&gt;mst.port-&gt;aux,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DP_DOWNSPREAD_CTRL, &amp;val, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg_kms(display-&gt=
;drm,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[CONNECTOR:%d:%s] Fa=
iled to read DP_DOWNSPREAD_CTRL: %zd\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;base.base.id=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;base.name, r=
et);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val &amp;=3D ~DP_MSA_TI=
MING_PAR_IGNORE_EN;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_mst_dpcd_write(&=
amp;connector-&gt;mst.port-&gt;aux,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DP_DOWNSPREAD_CTRL, &amp;val, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_send_power_updown_phy=
(&amp;intel_dp-&gt;mst.mgr, connector-&gt;mst.port,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fals=
e);<br>
&gt;&nbsp;<br>
&gt; @@ -1274,6 +1295,24 @@ static void mst_stream_pre_enable(struct intel_=
atomic_state *state,<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_send_power_updown_phy=
(&amp;intel_dp-&gt;mst.mgr, connector-&gt;mst.port, true);<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pipe_config-&gt;vrr.enable) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; u8 val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ssize_t ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D drm_dp_mst_dpcd_read(&amp;connector-&gt;mst.port-&gt;aux,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DP_DOWNSPREAD_CTRL, &amp;val, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg_kms(display-&gt=
;drm,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[CONNECTOR:%d:%s] Fa=
iled to read DP_DOWNSPREAD_CTRL: %zd\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;base.base.id=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;base.name, r=
et);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val |=3D DP_MSA_TIMING_=
PAR_IGNORE_EN;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_mst_dpcd_write(&=
amp;connector-&gt;mst.port-&gt;aux,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DP_DOWNSPREAD_CTRL, &amp;val, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp_sink_enable_decompr=
ession(state, connector, pipe_config);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (first_mst_stream) {<br>
&gt; @@ -1397,6 +1436,8 @@ static void mst_stream_enable(struct intel_atomi=
c_state *state,<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_enable_transcoder(pipe=
_config);<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intel_dp_set_infoframes(encoder, true, pipe_=
config, conn_state);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_crtc_modeset_e=
nable(display, pipe_crtc, pipe_config) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; const struct intel_crtc_state *pipe_crtc_state =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_a=
tomic_get_new_crtc_state(state, pipe_crtc);<br>
&gt; @@ -1451,6 +1492,15 @@ static int mst_connector_get_ddc_modes(struct d=
rm_connector *_connector)<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D intel_connector_upda=
te_modes(&amp;connector-&gt;base, drm_edid);<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (HAS_VRR(display)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool vrr_capable =3D intel_vrr_is_capable(connector);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_dbg_kms(display-&gt;drm, &quot;[CONNECTOR:%d:%s] VRR capable: %s\n&=
quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 connector-&gt;base.base.id, connector-&gt;base.name,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 str_yes_no(vrr_capable));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_connector_set_vrr_capable_property(&amp;connector-&gt;base, vrr_cap=
able);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_edid_free(drm_edid);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (intel_dp_tunnel_uhbr_lan=
es_wa_setup(intel_dp)) {<br>
&gt; @@ -1735,6 +1785,22 @@ static int mst_topology_add_connector_propertie=
s(struct intel_dp *intel_dp,<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_attach_force_audio_pro=
perty(&amp;connector-&gt;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_attach_broadcast_rgb_p=
roperty(&amp;connector-&gt;base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Reuse the colorspace property from t=
he root SST connector.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * MST connectors are created post devi=
ce-registration so new<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * properties cannot be created here.<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (intel_dp-&gt;attached_connector &amp;&am=
p;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;attache=
d_connector-&gt;base.colorspace_property) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; connector-&gt;base.colorspace_property =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;attached_c=
onnector-&gt;base.colorspace_property;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_object_attach_property(&amp;connector-&gt;base.base,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; connector-&gt;base.colorspace_property,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_MODE_COLORIMETRY_DEFAULT);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (intel_dp_has_gamut_metadata_dip(&amp;dp_=
to_dig_port(intel_dp)-&gt;base))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_connector_attach_hdr_output_metadata_property(&amp;connector-&gt;ba=
se);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Reuse the prop from =
the SST connector because we're<br>
&gt; @@ -1745,6 +1811,23 @@ static int mst_topology_add_connector_propertie=
s(struct intel_dp *intel_dp,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (connector-&gt;base.max_b=
pc_property)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drm_connector_attach_max_bpc_property(&amp;connector-&g=
t;base, 6, 12);<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Reuse the vrr_capable property from =
the root intel_dp SST connector<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * which was created during driver load=
 (before device registration).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * MST connectors are created after dev=
ice registration, so we cannot<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * create new properties here - we must=
 attach the existing one.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Also assign connector-&gt;vrr_capabl=
e_property so that<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * drm_connector_set_vrr_capable_proper=
ty() can update the value.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (HAS_VRR(display) &amp;&amp; intel_dp-&gt=
;attached_connector &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;attache=
d_connector-&gt;base.vrr_capable_property) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; connector-&gt;base.vrr_capable_property =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;attached_c=
onnector-&gt;base.vrr_capable_property;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_object_attach_property(&amp;connector-&gt;base.base,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; connector-&gt;base.vrr_capable_property,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return drm_connector_set_pat=
h_property(&amp;connector-&gt;base, pathprop);<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; @@ -1755,6 +1838,18 @@ intel_dp_mst_read_decompression_port_dsc_caps(s=
truct intel_dp *intel_dp,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 dpcd_caps[DP_RECEIVER_CAP=
_SIZE];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_desc desc;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Read MSA timing par ignore capabilit=
y from the sink's virtual DPCD.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This is independent of DSC support s=
o read it before the DSC check.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; u8 mst_dpcd[DP_RECEIVER_CAP_SIZE];<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (drm_dp_read_dpcd_caps(&amp;connector-&gt;mst.port-&gt;aux, mst_dpcd=
) =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;dp.mst_ms=
a_timing_par_ignore =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_sink_can_do_video_without_timing_msa(mst_dp=
cd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!connector-&gt;dp.dsc_de=
compression_aux)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&nbsp;<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/dr=
m/i915/display/intel_vrr.c<br>
&gt; index 51e4f3309b8b..9737a19c1899 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_vrr.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_vrr.c<br>
&gt; @@ -55,8 +55,19 @@ bool intel_vrr_is_capable(struct intel_connector *c=
onnector)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
false;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; fallthrough;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DRM_MODE_CONNECTOR_Disp=
layPort:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (connector-&gt;mst.dp)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (connector-&gt;mst.dp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Use cached MSA =
timing ignore capability from the DFP<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * sink's virtual =
DPCD, set during connector init in<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * intel_dp_mst_re=
ad_decompression_port_dsc_caps().<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Avoid live side=
band reads here as this function is<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * called from the=
 atomic check path.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!connector-&gt;dp.m=
st_msa_timing_par_ignore)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; intel_dp =3D intel_attached_dp(connector);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * Among non-MST DP branch devices, only an HDMI 2=
.1 sink connected<br>
<br>
--<br>
Jani Nikula, Intel</div>
</body>
</html>

--_000_BL1PR11MB5416F9A30BC85077F0B10AA693B72BL1PR11MB5416namp_--
