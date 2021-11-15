Return-Path: <SRS0=QaN2=QC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E997BC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 16:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B64E861AA2
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 16:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B64E861AA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98256E22B;
	Mon, 15 Nov 2021 16:31:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1386E1B6;
 Mon, 15 Nov 2021 16:31:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="230934523"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="230934523"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 08:30:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="735037090"
Received: from mvaradha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.108.39])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 08:30:57 -0800
Date: Mon, 15 Nov 2021 08:30:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20211115163057.w6ua2hsxdkspiz5n@ldmartin-desk2>
References: <cover.1636977089.git.jani.nikula@intel.com>
 <4d6a976459547407979f4b4c05a52785523e6bd8.1636977089.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4d6a976459547407979f4b4c05a52785523e6bd8.1636977089.git.jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] agp/intel-gtt: Replace kernel.h with
 the necessary inclusions
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
Cc: intel-gfx@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 01:53:12PM +0200, Jani Nikula wrote:
>From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
>When kernel.h is used in the headers it adds a lot into dependency hell,
>especially when there are circular dependencies are involved.
>
>Replace kernel.h inclusion with the list of what is really being used.
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
