Return-Path: <SRS0=KPZb=HM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FF2C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 10:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB19D64E31
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 10:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB19D64E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128566E878;
	Wed, 10 Feb 2021 10:36:06 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC98B6E203;
 Wed, 10 Feb 2021 10:36:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23831671-1500050 for multiple; Wed, 10 Feb 2021 10:35:57 +0000
MIME-Version: 1.0
In-Reply-To: <20210210093756.61424-2-tvrtko.ursulin@linux.intel.com>
References: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
 <20210210093756.61424-2-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Wed, 10 Feb 2021 10:35:59 +0000
Message-ID: <161295335978.6673.9313077497176923458@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/3] intel_gpu_top:
 Aggregate clients by PID by default
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-02-10 09:37:55)
> +static struct clients *aggregated_clients(struct clients *clients)
> +{
> +       struct client *ac, *c, *cp = NULL;
> +       struct clients *aggregated;
> +       int tmp, num = 0;
> +
> +       /* Sort by pid first to make it easy to aggregate while walking. */
> +       sort_clients(clients, client_pid_cmp);

You could eliminate this tiny bit of duplication by always calling
aggregated_clients() and returning here for !aggregate_pids.

> +       aggregated = calloc(1, sizeof(*clients));
> +       assert(aggregated);
> +
> +       ac = calloc(clients->num_clients, sizeof(*c));
> +       assert(ac);
> +
> +       aggregated->num_classes = clients->num_classes;
> +       aggregated->class = clients->class;
> +       aggregated->client = ac;
> +
> +       for_each_client(clients, c, tmp) {
> +               unsigned int i;
> +
> +               if (c->status == FREE)
> +                       break;
> +
> +               assert(c->status == ALIVE);
> +
> +               if ((cp && c->pid != cp->pid) || !cp) {
> +                       ac = &aggregated->client[num];
> +
> +                       /* New pid. */
> +                       ac->clients = aggregated;
> +                       ac->status = ALIVE;
> +                       ac->id = ++num;
> +                       ac->pid = c->pid;
> +                       strcpy(ac->name, c->name);
> +                       strcpy(ac->print_name, c->print_name);
> +                       ac->engines = c->engines;
> +                       ac->val = calloc(clients->num_classes,
> +                                        sizeof(ac->val[0]));
> +                       assert(ac->val);
> +                       ac->samples = 1;
> +               }
> +
> +               cp = c;
> +
> +               if (c->samples < 2)
> +                       continue;
> +
> +               ac->samples = 2; /* All what matters for display. */
> +               ac->total_runtime += c->total_runtime;
> +               ac->last_runtime += c->last_runtime;
> +
> +               for (i = 0; i < clients->num_classes; i++)
> +                       ac->val[i] += c->val[i];
> +       }
> +
> +       aggregated->num_clients = num;
> +       aggregated->active_clients = num;
> +
> +       return sort_clients(aggregated, client_cmp);
>  }

Ok, that works very well. Hmm. The sort order does seem a little jumpy
though. May I suggest ac->id = -c->pid; instead of num;
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
