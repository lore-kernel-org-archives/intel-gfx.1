Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304DDC433E6
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 13:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB4D964D5D
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 13:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB4D964D5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9F56E530;
	Wed, 17 Feb 2021 13:35:27 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A5B6E530
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Feb 2021 13:35:26 +0000 (UTC)
IronPort-SDR: TgyMLLE3o2GpyZ7WYPzABOirXPOr+HinuvrsmeFZss06LZES+VJRUA7M88dNYcoRxSNFpMaRHW
 2zsI88JPTDSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162326639"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="162326639"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 05:35:25 -0800
IronPort-SDR: E7KWUjU6pyOjNYF6HRxr6B+dxVyHroUbGhF3J5l8plQzlMsb3R99I7ELGnu3BC5EwFHt7QhBgj
 7Tej1d86EiqA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="385146056"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 05:35:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Winkler\, Tomas" <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
In-Reply-To: <062fec6f494b48fab840c64742fe767d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <87k0r7asmg.fsf@intel.com> <062fec6f494b48fab840c64742fe767d@intel.com>
Date: Wed, 17 Feb 2021 15:35:19 +0200
Message-ID: <875z2qbyw8.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [RFC PATCH 0/9] drm/i915/spi: discrete graphics
 internal spi
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 17 Feb 2021, "Winkler, Tomas" <tomas.winkler@intel.com> wrote:
>> 
>> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
>> > Intel discrete graphic devices have internal spi storage, that holds
>> > firmware and oprom images. The spi device is exposed to the user space
>> > via mtd framework to be accessed during manufacturing.
>> > The device is hardware locked after manufacturing and only read access
>> > is provided.
>> >
>> > The i915 plays role of a multi function device (mfd) and spi device is
>> > exposed as its child device. i915_spi platform driver binds to this
>> > device.
>> 
>> What's the plan wrt i915/spi maintainership?
>
> My suggestions is that this will be maintained by myself, as the major
> consumer is the manufacturing line.  It will be a separate section in
> MAINTAINERS file.

Works for me. Do you want to apply the patches directly to drm-intel, or
your own branch and send pull requests to i915 maintainers? Can also
start with the former, and move to the latter as needed.

Joonas, Rodrigo, thoughts?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
