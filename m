Return-Path: <SRS0=iOfG=LD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA71EC48BCF
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 11:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D1261359
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 11:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D1261359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1B36E183;
	Wed,  9 Jun 2021 11:50:10 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BF06E183;
 Wed,  9 Jun 2021 11:50:09 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lqwil-0006hA-UX; Wed, 09 Jun 2021 11:50:08 +0000
To: "Hans de Goede <hdegoede"@redhat.com, Mark Gross
 <mgross@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <548dd463-3942-00a1-85c3-232897dea1a3@canonical.com>
Date: Wed, 9 Jun 2021 12:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Intel-gfx] Computation of return value being discarded in
 get_cpu_power() in drivers/platform/x86/intel_ips.c
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

I was reviewing some old unassigned variable warnings from static
analysis by Coverity and found an issue introduced with the following
commit:

commit aa7ffc01d254c91a36bf854d57a14049c6134c72
Author: Jesse Barnes <jbarnes@virtuousgeek.org>
Date:   Fri May 14 15:41:14 2010 -0700

    x86 platform driver: intelligent power sharing driver

The analysis is as follows:

drivers/platform/x86/intel_ips.c

 871 static u32 get_cpu_power(struct ips_driver *ips, u32 *last, int period)
 872 {
 873        u32 val;
 874        u32 ret;
 875
 876        /*
 877         * CEC is in joules/65535.  Take difference over time to
 878         * get watts.
 879         */
 880        val = thm_readl(THM_CEC);
 881
 882        /* period is in ms and we want mW */
 883        ret = (((val - *last) * 1000) / period);

Unused value (UNUSED_VALUE)
assigned_value:  Assigning value from ret * 1000U / 65535U to ret here,
but that stored value is not used.

 884        ret = (ret * 1000) / 65535;
 885        *last = val;
 886
 887        return 0;
 888 }

I'm really not sure why ret is being calculated on lines 883,884 and not
being used. Should that be *last = ret on line 885? Looks suspect anyhow.

Colin


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
