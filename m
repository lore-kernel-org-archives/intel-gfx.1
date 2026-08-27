Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057B7C5DF9D
	for <intel-gfx@archiver.kernel.org>; Thu, 27 Aug 2026 08:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736E310EEFA;
	Thu, 27 Aug 2026 08:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QI07o9yi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0329610EF0F
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 Aug 2026 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787819888; x=1819355888;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=oQ2euYWOar0dYEaIF5bxNBLzXGPnCePEBcXIs6ytibA=;
 b=QI07o9yiJsuPbjv3r/dmpi/hM/l+8JXpx42uKsmf/BeXSZltCb+BK4Xo
 qagfjVOipzpXaoJe8foQWSuuIqGPpqsDdBw1aoXUP5eqsSKNTRXwZkMUZ
 IPRMPvU0iynA6ZAuWLDtrk26n7afJCsbRGfmv/A1YX8uRfxVlgUonjiKh
 GxSmFgSRtUPgH8qTqAQdm2Tk67U9Hh5Sm4azT2Kh/bUPmQtvWspDSEabm
 FCGNL5hyn/7TBsfqJFyaPUXQMuR9yt/RrlHSoK/oNm1lMqn+D4JFic8q/
 sa676nhloi8rg59OBvvhuTi53Bpw+y9ckv/VyTWEzL6zpr8/OigHS2IwE g==;
X-CSE-ConnectionGUID: qG+Z5OFURxeH1tRBhjoWWg==
X-CSE-MsgGUID: blb6eCuoRHa8ndzLi9hzRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88341638"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88341638"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:38:07 -0700
X-CSE-ConnectionGUID: MSXw4BLIT66NR7PpkkFbCA==
X-CSE-MsgGUID: qPevdVoJR+mO2VZBwFoZ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="273062944"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:38:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 01:38:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 01:38:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 01:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hywxsMGiGs7iGdNw2kP7UMkVL3G8KhKUnHheFy7P8qWeST/JpHazd17Z2mT5IcJffnBsuiX9wBxcy8a/CPzoFS0QQ/p6Aw0qkcmXBuqXKomVIbsZX7WidVP5fhZ/RilTLp8hJBug7a10int7g58LmDeA+qSxRkCGRKGNdC4Sh6+aX79phDgPc+ye5zUY4HBJ1v+hZFdHIq0mo1vD4EkZpeylXeVXQnkYANAcYdDCv+ECg7iiwH4jFeFBtc43PfrCEVyX3+qum2zrEjxAFrdvmh7Zg2q5OV9tgjm/BSmPBrVT3RZj8OvMPEDQ+rgu3X9hdh4I00TGK0x15Mq7pIEZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0Gowl60k5qJanr69mN+WbdE+X1xQbAbud3j7VHKRIU=;
 b=Yrpof3OF4Yr1TIq74lgsIBAonmB+pqqNkuAP8DX2je/R+WEQmN4imYElHV65H1fsO5xxEy7QSzWZ9AmD1RmN2WP+MiGt4/ilUwzv6WuAYg84sjjlAPqAszuvSoHWL2v+TL6Y2yvnoAN1OwidPHFOWN/zeO/TmC6MhI/bbYo416sXy5P6LP3OGsxKUr2a43RGaXoP3GDyiruOK3xAiY0sihx6Hc9bmtElM/n7WvOr2aOGbRyFi3LASP5goN8L+Gr1xmHoKpn504gFTReS4+6OZ4uBG86lnU3FvQNt510EL5apS+tldkLPhbfP0HGk3Cb27cCfly95VG013ZQxoYEaMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 08:37:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 08:37:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Aug 2026 10:39:47 +0200
Message-ID: <DKZLAJT619PA.2D39BHW4MUAIT@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>,
 <chris.p.wilson@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
 <ao8a-Y4re7PRKjIr@zenone.zhora.eu>
In-Reply-To: <ao8a-Y4re7PRKjIr@zenone.zhora.eu>
X-ClientProxiedBy: DUZPR01CA0159.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::16) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a83cc9-2865-4355-806e-08df04167fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|18002099003|22082099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: b04l978qEz3EYal47nNGON1XLocbgpAVQU9ciPHXFzPprHVuLXr1pg8Mj49G/v+1rBweFpiknU6M3j9JtAXHfNSxvzeaXxQbNrnL/4slGwc60iyTght+h+mAcZUfH2n/ppYH2CSUFiYc+BaVcGPluIZ8+1mxnXcaptRxElz3GekdTSJD1Q07okDwwuOveGSLkpG48IPXoNFp4gAxVDCZqD3D212KeBjFZbSJAYpDYtpoArvaVG5rIKGiVJmzBuXj5vwG1JnRvCWVWgDtOXEhGsPGzBTRvuiEhnZ4FuyEIHYd1c0R5SMNtgJFbcJtUlk1K1nd9cBwsay4ot3iOD4jNPKU33IKXha6IJkMtsqVJzVXcEJ0ZdIbhjAX+3zQdArNFTO0Yztt2MaRIvqcd1gSFVJSDomv+Y47KLcnz2WotjDoNh7jZgmq3ARs/+ZDZQwyhl1WVLdfjBc5w9D6LQZ7w8FtXNg7tUE4+eaqVx1SPjVD9rZd/us1/abnBJBjAs9HssAaBIjbs9K1oQjBrznUzML1APnpl8I/LatWKkH+NMkhQTzDFwlc3UIZDAJmodRxJhG6X3ECBPlfs87U0qK23gL7S2Uio3kSJAQ4G6sPjp04Aj+TDsr0YVkkagfdrr879PGUsE7zxXV3202IxLGtRy/nUJ0tV3BrOykN88sxgDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXk5SGFoamtFZ3E0RGUxb1R4cFFSazZxSUdOSjRUVWZ0YjdvaHU0eE5zalJv?=
 =?utf-8?B?SE1TdXBGbWJxSGdIV2RXUTRUZUVXclF4d280SFpJc3hPRFNTT1grYjh6L200?=
 =?utf-8?B?bGJhTHdkWnZKNXpHWmpLWkE5YTZCUTUra3hyYzZsYW5rY2tJZnBJRVJpQVE0?=
 =?utf-8?B?OGk1S3BXSDk2VnhzcGpEVlRqbVJhcU9SVXB4RDlmL05xUE1hTVljQytZdml0?=
 =?utf-8?B?alo3NjJqODZuOEo5am42UVh1VXB4TWZ6R0hwTGJaeUovVDMxTnRtNXpDbGpu?=
 =?utf-8?B?YkY3QWpkN0NmVEJnVDRRN3pZUUFpVHdxeFZwRjk1bTdhTnZBYTdobHh6dk5C?=
 =?utf-8?B?ZXJycEdBelFrK0tzbllRbEV5VWprTHZEZVdQNVRYRzhJalg2SGV5UkNNN1lp?=
 =?utf-8?B?cnN4OXYxQ3ZDc2pJS0tPUWRpaWFRNWU4NGRHczNGT0xTRVdSUjZXaGdiZ0lC?=
 =?utf-8?B?aEhQV1pxQjFMZk81VTFjZmlpT3FyQ3ErNFhYT25WZ09FejJ5M0pKbmoxU2ZH?=
 =?utf-8?B?MjYxNE5XNkY0U0JoeHFmbUFZa05YZlZHazlVeE1QUWpGc3ZzWmk1aDJoWTVU?=
 =?utf-8?B?T0g3bU9TeDNLUWNhamhKZTQrVjFJZVFpbzExZjBTd0hwZjJybVMrUjRFTXFk?=
 =?utf-8?B?c0Nhd283eXRsZ2pKRTNmQjJsUzR3c2p6djAwWFE0UFRlZjJCaUJaWlRnek1y?=
 =?utf-8?B?b1dQRGRRejRTbDEzOERHdWlvNGRJaVVwcTlaVFBKVy9rWDR3NHdwNEFnRDR5?=
 =?utf-8?B?ZW8zRkxLS2pLK1FxRm1xVlM0bDJjVmNCNTlEaC9EUEt0THErUFhUOGRnZCtS?=
 =?utf-8?B?ZW5ocDRrRTgvS21rWmJaZ3BRbjE3aWcxNDBONVVncnVWSGNkbHV0OGJmYmRj?=
 =?utf-8?B?NGkwMm1oRmVJLzI5YXc4eXovQ2tUTGZWTjdKOGpYTVhIelhNcHVyZ29Cb1VV?=
 =?utf-8?B?d1NhK04zMU50RFk4anNZOWlVS1czYklVRG1JL3lGVytKMEUxNEdnVXBjRHU1?=
 =?utf-8?B?bnVqUmJ5STNuc0F6Y093S0QvOC9uWnBrelpZZWtTL2x5QXBBR3FnVWN5MGc2?=
 =?utf-8?B?NlhpMTFpZTFFNmVuQlFwckhNclNzUVdna2xkWTlySG5sZ1ppT2RoQkR1N1dV?=
 =?utf-8?B?TFgvRm9rRUtUektZTCs4MW12bS85MWphVjZINEhUdGk1YXB1QXBZbEQyRUxZ?=
 =?utf-8?B?dy9WQlpiUURNQVFPaEdsWHladThtVnQ5T3cwQnIwTityUHZBbnMzWW9WYlEr?=
 =?utf-8?B?eXZNV3c0VExhdFE4RnROVmNpN01uS1kyZWViejRLTEZaWkdwNTd4T1M3azly?=
 =?utf-8?B?UkZOWEhwaStDd3ZpSDR1dEUrYmtTZ2t3cFJ5OTZvck92TzB5M1JHSzNyaWdz?=
 =?utf-8?B?UWx2NU8rVFo0QW1Tc0FrRFRuTWFoUnZJQlowd1JMMHdPVEFjZ3dmZWFTNHR5?=
 =?utf-8?B?YzV1Q0kyeWgwbEl3RVRsQ29qNVB4TWlJQ3dMNVJtZ3hiYzZoNjE2VkVHcS9h?=
 =?utf-8?B?cmo4SmxUaEpEUTlCbmJBRmZON1dGOEJQb3NtMmRvQ3BDR3dBM2J6TlRJNG42?=
 =?utf-8?B?VHgzVUpNRVZjTDFWa09CUzVVN3NncUpjb1JpUzBPUC9rY0NoSzNQYWxFemdl?=
 =?utf-8?B?MW5DUnkzMG5WRWliNlhvMExsV25NM2ZNREpINFpjdVRsWlkyTTljWU93OWxO?=
 =?utf-8?B?VFA2ZWJLMGREZTYwdFd3Q2h4N1JWa1Zxam93QXFoOVJZMTBobTFMN0U4aWMz?=
 =?utf-8?B?c0s4YzM4ZTNndk0vRmVocEFwdkQ2K1VGYWtobGVsakl3d1ZQRFhnZytZM2Y5?=
 =?utf-8?B?NEZoMFJJM01XYVFPU0NaeU1GL21iVHp4clJmdDc0MEhwR3luZkljYXFFYnQ4?=
 =?utf-8?B?aHRrdXdhSHhUTXlvV0F3QTFDSEdYTzFCZm13YjVPN0VGbks4ZlRlVWk0RTN0?=
 =?utf-8?B?OTlZMHo5WldITzF5ck5McENCYVphMzFKaUI0bDhOc3c1cUJvblQvNWhWTEFL?=
 =?utf-8?B?MGZObWVLR201ZGNPNVdmT1hnSDJUaUo4VUUwRkd5T3hxcEhYZEVXOGtzSlhs?=
 =?utf-8?B?QWNWa21wdHg3N1FHNXBBbC9PMjRIYThjU1dCQm1nc0Q5NkswaU83bnVLTDFz?=
 =?utf-8?B?N0FKK3p1OGNqUjdoS3hLWFE4MlZScGY5SG5IWUNkTWJFN05HTGppMkZaMnlC?=
 =?utf-8?B?VlJQelFheEhMaFBFcllxT1ZsYnlINkF2Yjg3WFZVM2ZEZGEyd2g1UTdBVDhT?=
 =?utf-8?B?K1JMU1JpanpFM1NMVEJhV0QrbnM4VXZyZFhRWGxNbUJzRXNXeVh1QU8zUDBn?=
 =?utf-8?B?VURaQkZsWjM5QnhqVlNjckFPU3ZvaldkTXd5N0VIeE41RFd3OWlBeXErV1No?=
 =?utf-8?Q?NNcMGsjvTzc9xmog=3D?=
X-Exchange-RoutingPolicyChecked: 0yRSQm0nzGxN1k3CuhDelUC9j/E8pRvqOajRXK9DZ5d7vLc0nrjJKlWfCA5p7Xjhug3/2uS8TG92CGaMlrlgqIXZxkWYKcSx9yF9ube2MUEnBejGJuiDKQfHqTdFZmgiIzllbc/gKY+4ieytfdWlqElWURmn4FAgMj7Bf8Y7TNQ23K9C40tbiOE2epPz/F3pJoiKKUxzL/42/Sz91pqHSvvICAGJWNRU5zRUSIvnCD/a2831hcbJHZcU0bj5wlSPWl5eUAl0hfQ13vhqMpopqg1TqqcxZY31HKk8+9quoy4SlYKAnckvnM4xjAvm0o01DAhlcMFZGd0TN8mwWKw5jw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a83cc9-2865-4355-806e-08df04167fcc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 08:37:59.2101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xdmk5jEFYYW9DCpxaoOjQINFb9XbEPoE6+zRag3wFtKTS5gXdexqVMK1jrmr8hMsp1u3JaD117ZXarL0thBnQX2xVqDCC6Enm8L4ovbnMxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

Hi Andi,

On Wed Aug 26, 2026 at 7:31 PM CEST, Andi Shyti wrote:
> Hi Sebastian,
>
> Have you checked sashiko's reviews? They look valid to me.
>
I checked, and there are already existing issues, probably wrth fixing,
but they're outside the scope of this patch.

> ...
>
>> @@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  				      ggtt->error_capture.start,
>>  				      PAGE_SIZE);
>> =20
>> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
>> -					     page << PAGE_SHIFT,
>> -					     ((page + 1) << PAGE_SHIFT) - 1))
>> +		mutex_lock(&gt->i915->mm.stolen_lock);
>> +		unused =3D !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> +						  page << PAGE_SHIFT,
>> +						  ((page + 1) << PAGE_SHIFT) - 1);
>> +		mutex_unlock(&gt->i915->mm.stolen_lock);
>> +		if (unused)
>
> this is always false.
Nothing really changes here, even if the if statement is always false,
we still need to guarantee safe access.

>
>>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
>
> And this needs to be inside the lock.
I don't really understand why, could you tell me more please?

>
>> =20
>>  		in =3D (void __force *)s;
>> @@ -143,10 +147,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  			in =3D tmp;
>>  		x =3D crc32_le(0, in, PAGE_SIZE);
>> =20
>> -		if (x !=3D crc[page] &&
>> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> -					     page << PAGE_SHIFT,
>> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
>> +		mutex_lock(&gt->i915->mm.stolen_lock);
>> +		unused =3D !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> +						  page << PAGE_SHIFT,
>> +						  ((page + 1) << PAGE_SHIFT) - 1);
>> +		mutex_unlock(&gt->i915->mm.stolen_lock);
>> +		if (x !=3D crc[page] && unused) {
>
> this is also always false and besides it needs to be included
> inside the locks.
Same here.

--=20
Best regards,
Sebastian

