Return-Path: <SRS0=EOwD=GZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC127C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 15:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598C520702
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 15:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598C520702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0EF6E9DE;
	Fri, 22 Jan 2021 15:43:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351856EA03
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 15:43:56 +0000 (UTC)
IronPort-SDR: MhcNCBoMrK0KK+MKD6dTwJhx5Oo9OFeqY0I0EkPffMLfMPAT9X/UXBrqCcHXjSM8noZiH/sMdt
 SuO5fGlji4uw==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="198218229"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="198218229"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 07:43:56 -0800
IronPort-SDR: uFX6Q7XWlsLisRhG22cpDND7FnJwJqhoDS8j9D0dWkzSLLgAkeGsDiMFBsgJHv7p8dldjjNTm+
 kHrhgylADiKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="467956995"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2021 07:43:55 -0800
Received: from [10.249.130.160] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.130.160])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 10MFhfU7027450
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 15:43:50 GMT
To: intel-gfx@lists.freedesktop.org
References: <20210122150622.21088-1-chris@chris-wilson.co.uk>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <2721424e-f72d-5531-aa75-a7f4ef59f823@intel.com>
Date: Fri, 22 Jan 2021 16:43:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122150622.21088-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 01/10] drm/i915/gt: SPDX cleanup
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



On 22.01.2021 16:06, Chris Wilson wrote:
> Clean up the SPDX licence declarations to comply with checkpatch.

typo here and in the commit message 04/10

> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

for the whole series, with above typos fixed,
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks,
Michal
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
