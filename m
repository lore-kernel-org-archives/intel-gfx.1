Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E600C88E75
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 05:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA4210F9A2;
	Tue, 15 Sep 2026 05:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzRJ1aZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221F110F9A1
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Sep 2026 05:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789451184; x=1820987184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0My4kXKB9KuBFkzfMMMpgHKqQWnOmLZATNGyT9w9wgE=;
 b=nzRJ1aZIXb2EcsjzqPa7xyLHfOnm4t/Q93LDaRyIRzNj2M//OdEYxu7B
 Vn+VHPUUzKhiu1K+YKbRg+yYAbwbBzx48puAlfl5Ph/WOWiDa0E0hUNde
 jaPAEqZZMjsFjM3Q7QOeCb5eCI5cv28E/lCtY/0RQgwdUbegeIyRQBwNR
 Pw35s+PmqlmSlD2w9Si1imY2D0MunQFG/Xgn16Ru3DRVuHz2RAB5Q6gFE
 +7FEdFeOJwyqqzFC1Oj9EwfDkz61KoxjiIA8JKn3hD/NeUvRJ6F1Gevmv
 pDEVV70btqzwJVXFJypQpdozJaPzQcE6nSNO/IUldIENuQEwyRMl03ggI w==;
X-CSE-ConnectionGUID: v8GgYRSFT8K1eqWc/UCA8w==
X-CSE-MsgGUID: 6zTP+C7FTCyjDY8gvLKlGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88942912"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88942912"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:46:23 -0700
X-CSE-ConnectionGUID: BivbZshySdK/HPVW+pVWJg==
X-CSE-MsgGUID: oPkr8TNOTXS5kKzjAGB0fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1059024"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:46:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:46:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:46:23 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:46:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5GMMe1zKktqX1VRouFfyAMRASuo0jyawtrDZUkc68pW6KtdpOwTIVxH2h13jc8lu3CUI8rtZhbt3Ab92OUteZOIKQldKyTRUY6lPckpnmpivV2lMF8RpBxBz2sH5rievidAhDjYSUVXGGHcNv9wHEZjB3R3q7fOFJnbWWfF/tmyPYgyt1/vUX/EHMNCKK3LhNR5xDJKYy+Rt0NGkezp9xrk3YdKK9L579XlB3+8d8tpDGt2w+qqmiBgxyFePTvARuuYP6NxMQr3JSyl+/95r+zN9JHug+q5ihExtWlK2W86Yxy6P2eNj/bA8vhpQoALlwHENrqUYyWdBs9zYTElvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqah43rW7RVEGn0aJhqZSd167BbbSXlopTp+8ES4RsY=;
 b=flSqXgnnVWoOjT1lYhkqj2Y1Dq9ibhkU+CfqMxX3ORS+Bv0JMI0ovu5e0hhNjbZRy5Nic0GUG3vSUfcRi8vb0P2CoMQOaRUy69oRY5rFSnMJXP4Buw/iyzKqmjGHJhNU4irlzHRKRsQyFAXnMKG4ZijvzvpDS4mrXhNg3R4ebRcrJnMlywFv/bqUZB2KcZta4h5Q82utx542c/UXDUAECu2/Djb8hQKR2eAy2ZUUCpmTTE586Er/K+Zx2CCmy/M4zweRSXWWzVPuqTY6XxedLptJeQdrktmI2K3K3W9kkXfWtQ2HWe00/I5Jf7nZ5eiOUK7zU79Ovkkwsz5a8xfLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB7622.namprd11.prod.outlook.com
 (2603:10b6:8:144::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:46:20 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 05:46:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCHv6] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv6] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdRMoUTzGv+vrltEK6ZvVHeUeRPrbPIWHw
Date: Tue, 15 Sep 2026 05:46:20 +0000
Message-ID: <DS4PPFE901A304FC49B062FCA9B9BCDD0E5E3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260915042300.2201757-1-arun.r.murthy@intel.com>
In-Reply-To: <20260915042300.2201757-1-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB7622:EE_
x-ms-office365-filtering-correlation-id: 6e9ae4ce-cedd-480b-92ad-08df12ecab43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|6133799003|4143699003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 6HFHQP1hylpGz4T3zcyxsDzF2Et62WOhVQP7gku0LKB1GYGXx14DfsoMUOD/Yj+LLytOIbTHo+vLLDdMcCPKnH70/sqXsPXCcFLpLxDAYjxveLbtMztLu3QAzB3DYSEzUqWN5cfExvf+/bcTly0QmbHZZsiN+xA/EC1ljugYvtz7xLzJdMjXe/Eo9jcqdh35K+3suCl1Rs9VWsbg69ZpKdT1KekJSqq5fn27IHJROvw7YicZt7QLyg6ScxsWfD58PmvuQshnuJCWTgeCt1ErajyeKoStRLG7kAzu6hS4IfxW/WnGDQbDLsW6wJEF4ULimMDgGrEZLyrtDNdxaW+zlwfMDl4Uj9f3efweizA4ZnwEktmuj8/YT7ICP5Z1eXsNc411PF4r4JO+8xNEuRbCfPZQIT56OBIjXfWedauB5T1FqxXTeLa8hzbxlwuyakBkM/o4JAZHXJy5mO6Dfn4DHCAJGCXo5KHdN/I1MKwNK27VezjOpAJbWkKcUYofQdzzttwXN+hxnMJRBp+KebxjYARwu8GVbMW1YRguuENiwB2dkgV6RqtqBNAzZn1yME2N3uj71c4ePtkdtfqVyfDkKqQNcnUfvyt+LydUzrTwRVMN4IxXJsCTEvxdIajon4/gQv06LXE1h8q9UQjd4oNnotQUnwjAuK+6imB5OZ8Jh3w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(6133799003)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mKBF3FcoogkhyjW2e/qhpkvLfG3s18Ba9hBLHOPReZsSHQvhFi1cWVWoZ3Os?=
 =?us-ascii?Q?R6PgmKro9dYvuYIrAyInHMTm5nOaRKrcRn+a6LMR+DP5JDd4pq3tfqZA8tpM?=
 =?us-ascii?Q?vJllhQzLKkfd03VNDTtKDQu/djLwGnqYgLHrQsAFmLk7lQT6PCw9ptMUbnN3?=
 =?us-ascii?Q?+M5doEURISmuRFijuQvAfB11jCAvOfFSJRvNWq/k7eZWBPToYH6RHZjJ5DDs?=
 =?us-ascii?Q?Ic5kf2G5OlRirtkHHvr1faLVXdI/oNIQUh/A2Mk2wc8TzxaUQzKhxH+GBmtw?=
 =?us-ascii?Q?82AZ3MX4S9Yalvwx01VeOc1EpKDcBoxBuNWF8jyBmeL6751REKh0pjXW4bQS?=
 =?us-ascii?Q?Yv2TMpoYydRf/p28hHsd9irGeO6wr1kGpAq3Qrsr67Oyn/VKBDqbSXR7YEEH?=
 =?us-ascii?Q?RaAo5c59K+pTXT0LcLqKNOW3eG2cP6RoxH+ocNBU4nJ/4YO3bHVOO/jM/qq4?=
 =?us-ascii?Q?7R81Yc3dl8xyA5y5TUpwOS4ArjoxISuBumBiNWNBju0Tp281dxjGpZR62n5f?=
 =?us-ascii?Q?OxrPQASXh5Ry1BV+HUV3xny3TqjxgMRbRLDeVqR/asDqDM7kq4O1JEuW/cWt?=
 =?us-ascii?Q?/zZJ5/LsMRHhQRbn5joceGSJx1FybjdIvQ9YaD/IQ52kpHE3N9iTO++hiLUK?=
 =?us-ascii?Q?uhOanuhPGOyGK0kvc8T+ay9YY2iVsvw6NxFipL8JXSSk1XWS914BKHnlCm8W?=
 =?us-ascii?Q?CX7LralA/fBSWj8hvXEgoIARc2w738QnwZMnxzFe9AICuM9VfE+biXQ0QFgK?=
 =?us-ascii?Q?4j94x76bI074CpwTDnq48KY/NFckSLwe2wnh9LtCMqvCuxUv/qluXZcNGBgO?=
 =?us-ascii?Q?o157miWeWFQtU067ZSQ6xULhNs1zW/OgdBZiy98tAeuG6baMUSMyhdJbsbGQ?=
 =?us-ascii?Q?I9TquNBwLLAnweo9Dxo2tHovW4FnuaWb7qYaurx7KXJ0MTfNHCajEFDAUaGY?=
 =?us-ascii?Q?wym4e+ZkUmW4IeUglqPfTfxMeRNh/H0pFv3uEAKrwjvvDU4NeFWQzIEdQ3aZ?=
 =?us-ascii?Q?aQHRny/GWVBivzl/YAxdnYKP7So3DIXBCY1wqCAcA+h1iRh8h5wnV20SsClx?=
 =?us-ascii?Q?50X592X+nC7W2Vy8lCya8dWr9EeFIj6OnAfHluSB/Sl8a/RTy6VbV52QYVBF?=
 =?us-ascii?Q?sXPCpYpG6rOXmyfjjRDTkqDcHEZo4czHGXRDn5vjiR/d3wZjlAm57+kPYr8y?=
 =?us-ascii?Q?iBpScSYhkZuMVV1Rf8S4b8nyIzjYj7r0T4rsr08C7Bjdb4UMqXwy8rumF7xf?=
 =?us-ascii?Q?DKt9ffkWSofDnlahsvA3Ng8iq1lGbqVwOSoAIL14CAfvT52iS1YzXWVO4OL3?=
 =?us-ascii?Q?gJSCCMuJzlPuhPixCXM7eCGVJDV/pDztu82Ss9N+Ursxsd2JNFqrhm68tSDN?=
 =?us-ascii?Q?uGgsVUYQCfPDhh2XN0HGYX8AHWXomfJRWxOJwgKnQefZVh9Wv9JaKsqHhh0Q?=
 =?us-ascii?Q?LvPL4hEkklv0v4mlcD5Tyfl4TP5J3pLIKl+VkA4kJ3l4bU7z9DMacts9x59X?=
 =?us-ascii?Q?VH11K5Xc4N7yA/+i/+ovM7HbI/q6DyQyZE8bJsD/MsZwiokrOCs2BGDR85eT?=
 =?us-ascii?Q?JPwRGmooHAh42Pzs6hAY403qhApIqjaE+DqSSbfScYRFGNEBviJd60Xu3/Y4?=
 =?us-ascii?Q?LjVNEzdp4X2IYGV49aa6ralRrKevr8GWzr5iKuI5BmOSCVH1CBSvG3lWtUJi?=
 =?us-ascii?Q?xjgWnJIM9vqRopr4crp177ycNH/v7nviub2+zyUcbODfEkOYYnMstCkRs4Ma?=
 =?us-ascii?Q?mC6cANPMOA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z4bgrbHce54ZjHpu/tZ1w90LBJ8IfKOBry3zvqG8+cmpeVEFsNhckFa5X3fX5SBO0++nHdrBBnznK3FegVUxGQmJsqizhyw9jCeFSB1jiW60xzhuVlpxQmXcl42yuf4mZ/nojEk3sYL4ZShQWPiC6yD8SuFiHoYJUGK/GuR+uqheF1G1nK8bJHh+iQQZQvK72MUXLeNiO28je7Rc9zVEtpJ4h/IW4dguxg/wgm6EJ9K+ZHpXmvG8tRHP2G7bBjfu9/pvVdsAJytzX1ZhF+3pSYIuxpqYPG3Ika54pQ5aHD4ulmy6Nx8mmZFvVEdVQVMCHhCFvkXX8jalDdtrzAaACg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9ae4ce-cedd-480b-92ad-08df12ecab43
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:46:20.4604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkA15EW+wuJFtdTb+7g0pZDE6w6iyOikImW53qfcAyipmUK2N+4jiEDlq0iJI3JIj+YADWlV9aultZ/5e0Zaaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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

> Subject: [PATCHv6] drm/i915/dp: On DPCD init wake the DPRx for eDP
>=20
> Its observed that on AUX_CH failure, even if the retry is increased to 10=
00, it
> does not succeed. Either the command might be wrong or sink in an
> unknown/sleep state can cause this. So try waking the sink device.
> Before reading the DPCD caps wake the sink for eDP.
>=20
> v2: Use poll_timeout_us (Jani N)
>     Add the reason, why this change is required (Ville)
> v3: Wake sink only for eDP
>     Remove the dpcd probe set to true/false in wake_sink (Imre)
> v4: make edp_wake_sinc() static and dpcd_readb -> dpcd_reab_byte (Suraj)
> v5: Drop poll_timeout_us. drm_dp_dpcd_read_byte() already retries the AUX
>     transaction internally (up to ~16ms), so the outer 6ms poll could
>     never iterate and only added a pre-read delay on the hot path; read
>     DP_SET_POWER once instead. Wake the sink before reading the DPCD
>     caps, otherwise a sleeping sink fails the caps read and returns
>     early before the wake ever runs. (Suraj, Jani, Sashiko)
> v6: Mask and write DP_SET_POWER (Sashiko)
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 38 +++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0cd5e6b5034c..c44d584cc07a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp=
)
>  	intel_edp_set_data_override_rates(intel_dp);
>  }
>=20
> +static void intel_edp_wake_sink(struct intel_dp *intel_dp) {
> +	u8 value =3D 0;
> +	int ret;
> +
> +	/*
> +	 * Read the current sink power state. drm_dp_dpcd_read_byte()
> already
> +	 * retries the AUX transaction internally, so a single read suffices.
> +	 * First commercial eDP panels are Ver1.0 or 1.1, on which DPCD
> +	 * DP_SET_POWER is supported.
> +	 */
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SET_POWER,
> &value);
> +
> +	/*
> +	 * If the AUX read failed the sink may be asleep and not responding,
> +	 * or it read back D3; in either case wake it up to D0.
> +	 * In case of AUX read failure which is usually a POR case, the
> +	 * remaining bits of register 0x600 is set to '0' on POR. So a bare
> +	 * write should be fine.
> +	 */
> +	if (ret < 0 || value =3D=3D DP_SET_POWER_D3) {
> +		value &=3D ~DP_SET_POWER_MASK;
> +		value |=3D DP_SET_POWER_D0;
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       value);
> +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1
> sec 2.3.1.2) */
> +		fsleep(1000);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       value);
> +	}
> +}
> +
>  static bool
>  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector
> *connector)  { @@ -4789,6 +4821,12 @@ intel_edp_init_dpcd(struct intel_dp
> *intel_dp, struct intel_connector *connector
>  	/* this function is meant to be called only once */
>  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
>=20
> +	/*
> +	 * Spec DP2.1 Section 3.5.2.16 page 966.
> +	 * Also if sink is asleep, this will wake the sink.
> +	 */
> +	intel_edp_wake_sink(intel_dp);
> +
>  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
>  		return false;
>=20
> --
> 2.25.1

