Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D540C606A31E
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 20:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WD5B6Bk8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4A10E581;
	Mon, 23 Nov 2026 20:04:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322110F1BB
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795464234; x=1827000234;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VasLPeVuJLssqSZY1I5MjYcrjLzjVxoKeCg3vijwvF4=;
 b=WD5B6Bk85+enuLijEoQd3u9qbx8k2mulXnzN5AzqFCIGm+nT8NWefJCW
 lg3nzVcvQCy9Tj16XxQrV5OJh5JNiZWYa9Ve7OL9pBquCfn4UJwNY/xwb
 AWeu08FGdoDInr4VoMbxhZy9a2tFskDhj4xWdIcd7BioIT5UjCLLmlE92
 U5Sqd9irq96McPChnXQRnF2bUq9GYJpheuEfPbFK6KscR3TP+VW6X7tV/
 YQvfAz1kwTn8+uEBNMdDfZnUCvXhQSk25T7IVaV+x13/B5TCAUTx7+5f4
 axA0GwgQy3QVAlO4UFtUpIZcPDCXPJoQA7OKgstiIffexhHjBaUD4I8ge w==;
X-CSE-ConnectionGUID: T6tdprSEQEeZsh5eEHvCEg==
X-CSE-MsgGUID: 85UqrKwPT8mkLV6bNKXpfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4179184"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4179184"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:03:53 -0800
X-CSE-ConnectionGUID: EiLeD59RQ/uydRs6YcCnYg==
X-CSE-MsgGUID: iveeuOJCSB6ampHJdQMHhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11757158"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:03:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/gvt: Descend to GVT Makefile through
 kbuild, not include
In-Reply-To: <awOv5SfoKabE-vBR@dell-wzy>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261120155734.259742-1-jani.nikula@intel.com>
 <20261120155734.259742-2-jani.nikula@intel.com>
 <awBxf9ixOpSQpj1q@intel.com>
 <40de34776e441b082b4dfa5e1d76ef933ea303e7@intel.com>
 <awOv5SfoKabE-vBR@dell-wzy>
Date: Mon, 23 Nov 2026 22:03:50 +0200
Message-ID: <416c86c3fab7d2064fd635dc6ff8fd12f63505fe@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
> On Fri, Nov 20, 2026 at 07:04:22PM +0200, Jani Nikula wrote:
>> On Fri, 20 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>> > On Fri, Nov 20, 2026 at 05:57:34PM +0200, Jani Nikula wrote:
>> >> Treat the gvt/ subdirectory and Makefile like a regular kernel driver
>> >> directory, and descend to it through kbuild, not Makefile include.
>> >>=20
>> >> The main change is that the resulting kvmgt.ko is also placed in the
>> >> gvt/ subdirectory in the build directory.
>> >
>> > Does this also change where the module gets installed finally?
>>=20
>> Probably. If anyone depends on the exact location, they'll be hosed.
>>=20
>
> No, I don't think anyone depends on that, as long as module deps
> handled it fine.
>
> Reviewed-by: Zhenyu Wang <zhenyuw.linux@gmail.com>

Thanks, pushed to din, with slightly tweaked commit message as requested
by Ville.

BR,
Jani.

--=20
Jani Nikula, Intel
