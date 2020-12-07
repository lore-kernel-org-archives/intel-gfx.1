Return-Path: <SRS0=NHSF=FL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF675C433FE
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 11:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D0C52333F
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 11:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D0C52333F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B947589AC2;
	Mon,  7 Dec 2020 11:55:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D077A89AC2
 for <Intel-gfx@lists.freedesktop.org>; Mon,  7 Dec 2020 11:55:46 +0000 (UTC)
IronPort-SDR: qnAaQ004s5aqMthHfJJwFBt3LQA4nqmWb8NT2y3Qk4BxuTaEH/xjI8Ff+sAeOOsGxHDMVLjFH5
 041G98z8Jb6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="191956534"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="191956534"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 03:55:46 -0800
IronPort-SDR: pkRZyUJchUdl+6UNSS9iPKMaiipx37gPfQl8e/eX7T6KsILLWDLoclM+Vat8cXSNN4w0NY4Q7Z
 N0XZ9ydpT1kA==
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="541468874"
Received: from tcujba-mobl.ger.corp.intel.com (HELO localhost) ([10.252.9.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 03:55:45 -0800
MIME-Version: 1.0
In-Reply-To: <20201207002134.13731-8-sean.z.huang@intel.com>
References: <20201207002134.13731-1-sean.z.huang@intel.com>
 <20201207002134.13731-8-sean.z.huang@intel.com>
To: "Huang, Sean Z" <sean.z.huang@intel.com>, Intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160734214290.9322.10418886468519670642@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 07 Dec 2020 13:55:43 +0200
Subject: Re: [Intel-gfx] [RFC-v1 07/16] drm/i915/pxp: Implement funcs to
 create the TEE channel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Huang, Sean Z (2020-12-07 02:21:25)
> Currently ring3 driver sends the TEE commands directly to TEE, but
> later, as our design, we would like to make ring3 sending the TEE
> commands via the ring0 PXP ioctl action instead of TEE ioctl, so
> we can centralize those protection operations at ring0 PXP.

Kernel vs. userspace nomenclature to be used.

The description feels incorrect given no IOCTL will be exposed.

This is missing an explanation as to why it would be needed for
singleton session, so I think this patch should not be included in the
series.

Regards, Joonas
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
