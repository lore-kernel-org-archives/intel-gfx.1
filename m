Return-Path: <SRS0=h8SK=PP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0D9C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 05:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B00F60EBD
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 05:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B00F60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EC289DC1;
	Wed, 27 Oct 2021 05:37:08 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E05F89DC1
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Oct 2021 05:37:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="228831733"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="228831733"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 22:37:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="555110699"
Received: from dzhang-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.142.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 22:37:01 -0700
Date: Tue, 26 Oct 2021 22:36:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mullati Siva <siva.mullati@intel.com>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Message-ID: <20211027053658.z7wubvbg3nigklql@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211022192756.1228354-1-siva.mullati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211022192756.1228354-1-siva.mullati@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: abstraction for iosf to compile
 on all archs
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

On Sat, Oct 23, 2021 at 12:57:56AM +0530, Mullati Siva wrote:
>From: "Mullati, Siva" <siva.mullati@intel.com>
>
>The asm/iosf_mbi.h header is x86-only. Let's make IOSF_MBI kconfig
>selection conditional to x86 and provide a header with stubs for other
>architectures. This helps getting i915 available for other
>architectures in future.
>
>Signed-off-by: Mullati, Siva <siva.mullati@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
